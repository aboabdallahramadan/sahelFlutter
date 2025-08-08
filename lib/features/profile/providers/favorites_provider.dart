import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../home/models/offer_model.dart';
import '../services/favorites_service.dart';

part 'favorites_provider.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default([]) List<OfferModel> offers,
    @Default(false) bool isLoading,
    @Default(false) bool hasMore,
    int? nextCursor,
    String? error,
  }) = _FavoritesState;
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, FavoritesState>((ref) {
  return FavoritesNotifier(ref);
});

class FavoritesNotifier extends StateNotifier<FavoritesState> {
  final Ref _ref;

  FavoritesNotifier(this._ref) : super(const FavoritesState());

  Future<void> loadFavorites() async {
    if (state.isLoading) return;

    state = state.copyWith(
      isLoading: true,
      error: null,
      offers: [],
      hasMore: false,
      nextCursor: null,
    );

    try {
      final service = _ref.read(favoritesServiceProvider);
      final response = await service.getMyFavorites(limit: 20);

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
          error: response.message.isEmpty
              ? 'Failed to load favorites'
              : response.message,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> loadMoreFavorites() async {
    if (state.isLoading || !state.hasMore || state.nextCursor == null) return;

    state = state.copyWith(isLoading: true);

    try {
      final service = _ref.read(favoritesServiceProvider);
      final response = await service.getMyFavorites(
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
          error: response.message.isEmpty
              ? 'Failed to load more favorites'
              : response.message,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<bool> toggleFavorite(int offerId) async {
    final index = state.offers.indexWhere((offer) => offer.id == offerId);
    final isFavorite = index != -1;

    try {
      final service = _ref.read(favoritesServiceProvider);

      if (isFavorite) {
        final response = await service.removeFromFavorites(offerId);
        if (response.success) {
          // Remove from local state
          state = state.copyWith(
            offers: state.offers.where((offer) => offer.id != offerId).toList(),
          );
          return true;
        }
      } else {
        final response = await service.addToFavorites(offerId);
        if (response.success) {
          // Note: The offer needs to be fetched from another source to add it here
          // For now, we'll just return success
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> refresh() async {
    state = const FavoritesState();
    await loadFavorites();
  }
}
