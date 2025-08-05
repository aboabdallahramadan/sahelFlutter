import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../features/home/services/home_service.dart';
import '../../../features/home/models/offer_model.dart';

part 'subcategory_offers_provider.freezed.dart';

// Filter parameters for subcategory offers
@freezed
class SubcategoryFilterParams with _$SubcategoryFilterParams {
  const factory SubcategoryFilterParams({
    required int categoryId,
    int? regionId,
    double? minPrice,
    double? maxPrice,
    String? searchTerm,
  }) = _SubcategoryFilterParams;
}

// State for offers with pagination
class OffersState {
  final List<OfferModel> offers;
  final bool isLoading;
  final bool hasMore;
  final int? nextCursor;
  final String? error;

  OffersState({
    this.offers = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.nextCursor,
    this.error,
  });

  OffersState copyWith({
    List<OfferModel>? offers,
    bool? isLoading,
    bool? hasMore,
    int? nextCursor,
    String? error,
  }) {
    return OffersState(
      offers: offers ?? this.offers,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      nextCursor: nextCursor ?? this.nextCursor,
      error: error,
    );
  }
}

// Notifier for filtered offers management
class SubcategoryOffersNotifier extends StateNotifier<OffersState> {
  final HomeService _homeService;
  final SubcategoryFilterParams _filterParams;

  SubcategoryOffersNotifier({
    required HomeService homeService,
    required SubcategoryFilterParams filterParams,
  })  : _homeService = homeService,
        _filterParams = filterParams,
        super(OffersState()) {
    loadInitialOffers();
  }

  Future<void> loadInitialOffers() async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _homeService.getFilteredOffers(
      limit: 10,
      categoryId: _filterParams.categoryId,
      regionId: _filterParams.regionId,
      minPrice: _filterParams.minPrice,
      maxPrice: _filterParams.maxPrice,
      searchTerm: _filterParams.searchTerm,
    );

    if (response.success && response.data != null) {
      state = state.copyWith(
        offers: response.data!.items,
        hasMore: response.data!.hasMore,
        nextCursor: response.data!.nextCursor,
        isLoading: false,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        error: response.message,
      );
    }
  }

  Future<void> loadMoreOffers() async {
    if (state.isLoading || !state.hasMore || state.nextCursor == null) {
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    final response = await _homeService.getFilteredOffers(
      cursor: state.nextCursor,
      limit: 10,
      categoryId: _filterParams.categoryId,
      regionId: _filterParams.regionId,
      minPrice: _filterParams.minPrice,
      maxPrice: _filterParams.maxPrice,
      searchTerm: _filterParams.searchTerm,
    );

    if (response.success && response.data != null) {
      state = state.copyWith(
        offers: [...state.offers, ...response.data!.items],
        hasMore: response.data!.hasMore,
        nextCursor: response.data!.nextCursor,
        isLoading: false,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        error: response.message,
      );
    }
  }

  Future<void> refresh() async {
    state = OffersState();
    await loadInitialOffers();
  }
}

// Provider for filtered offers
final subcategoryOffersProvider = StateNotifierProvider.family<
    SubcategoryOffersNotifier, OffersState, SubcategoryFilterParams>(
  (ref, filterParams) {
    final homeService = ref.watch(homeServiceProvider);
    return SubcategoryOffersNotifier(
      homeService: homeService,
      filterParams: filterParams,
    );
  },
);
