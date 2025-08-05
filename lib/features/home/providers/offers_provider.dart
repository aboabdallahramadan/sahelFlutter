import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/home_service.dart';
import '../models/offer_model.dart';

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

// Notifier for offers management
class OffersNotifier extends StateNotifier<OffersState> {
  final HomeService _homeService;

  OffersNotifier({required HomeService homeService})
      : _homeService = homeService,
        super(OffersState()) {
    loadInitialOffers();
  }

  Future<void> loadInitialOffers() async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _homeService.getOffers(limit: 10);

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

    final response = await _homeService.getOffers(
      cursor: state.nextCursor,
      limit: 10,
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

// Provider for offers
final offersProvider =
    StateNotifierProvider<OffersNotifier, OffersState>((ref) {
  final homeService = ref.watch(homeServiceProvider);
  return OffersNotifier(homeService: homeService);
});
