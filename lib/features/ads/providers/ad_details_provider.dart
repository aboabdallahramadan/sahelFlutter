import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/ads_service.dart';
import '../models/ad_detail_response.dart';

// Provider for a single ad details
final adDetailsProvider =
    FutureProvider.family<AdDetailResponse?, int>((ref, adId) async {
  final service = ref.watch(adsServiceProvider);
  final response = await service.getAdDetails(adId);

  if (response.success && response.data != null) {
    return response.data;
  }
  return null;
});

// Provider for managing favorite state
final favoriteNotifierProvider =
    StateNotifierProvider.family<FavoriteNotifier, bool, int>((ref, adId) {
  return FavoriteNotifier(ref, adId);
});

class FavoriteNotifier extends StateNotifier<bool> {
  final Ref _ref;
  final int _adId;

  FavoriteNotifier(this._ref, this._adId) : super(false) {
    // Initialize favorite state from ad details
    _initializeFavoriteState();
  }

  void _initializeFavoriteState() async {
    final adDetails = await _ref.read(adDetailsProvider(_adId).future);
    if (adDetails != null) {
      state = adDetails.isFavorite;
    }
  }

  Future<void> toggleFavorite() async {
    final service = _ref.read(adsServiceProvider);
    final previousState = state;

    // Optimistically update the UI
    state = !state;

    try {
      final response = await service.toggleFavorite(_adId);

      if (!response.success) {
        // Revert on failure
        state = previousState;
      } else {
        // Invalidate the ad details to refresh the data
        _ref.invalidate(adDetailsProvider(_adId));
      }
    } catch (e) {
      // Revert on error
      state = previousState;
      // The 401 error will be handled by the interceptor
      rethrow;
    }
  }
}
