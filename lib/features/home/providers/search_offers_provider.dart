import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/offer_model.dart';
import '../services/home_service.dart';

part 'search_offers_provider.freezed.dart';

@freezed
class SearchOffersState with _$SearchOffersState {
  const factory SearchOffersState({
    @Default([]) List<OfferModel> offers,
    @Default(false) bool isLoading,
    @Default(false) bool hasMore,
    @Default('') String searchTerm,
    int? nextCursor,
    String? error,
  }) = _SearchOffersState;
}

final searchOffersProvider =
    StateNotifierProvider<SearchOffersNotifier, SearchOffersState>((ref) {
  return SearchOffersNotifier(ref);
});

class SearchOffersNotifier extends StateNotifier<SearchOffersState> {
  final Ref _ref;

  SearchOffersNotifier(this._ref) : super(const SearchOffersState());

  Future<void> updateSearchTerm(String searchTerm) async {
    if (searchTerm == state.searchTerm) return;

    state = state.copyWith(
      searchTerm: searchTerm,
      offers: [],
      hasMore: false,
      nextCursor: null,
      error: null,
    );

    if (searchTerm.isNotEmpty) {
      await _loadOffers();
    }
  }

  Future<void> _loadOffers() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final service = _ref.read(homeServiceProvider);
      final response = await service.getFilteredOffers(
        searchTerm: state.searchTerm,
        limit: 20,
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
          error: response.message ?? 'Failed to load search results',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> loadMoreOffers() async {
    if (state.isLoading || !state.hasMore || state.nextCursor == null) return;

    state = state.copyWith(isLoading: true);

    try {
      final service = _ref.read(homeServiceProvider);
      final response = await service.getFilteredOffers(
        searchTerm: state.searchTerm,
        cursor: state.nextCursor,
        limit: 20,
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
          error: response.message ?? 'Failed to load more results',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> refresh() async {
    if (state.searchTerm.isNotEmpty) {
      state = state.copyWith(
        offers: [],
        hasMore: false,
        nextCursor: null,
        error: null,
      );
      await _loadOffers();
    }
  }
}
