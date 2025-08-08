import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../home/models/offer_model.dart';
import '../../home/services/home_service.dart';

// Provider for fetching similar ads based on category
final similarAdsProvider =
    FutureProvider.family<List<OfferModel>, int>((ref, categoryId) async {
  try {
    final service = ref.read(homeServiceProvider);
    final response = await service.getFilteredOffers(
      categoryId: categoryId,
      limit: 10,
    );

    if (response.success && response.data != null) {
      return response.data!.items;
    }

    return [];
  } catch (e) {
    // Re-throw the error so the FutureProvider can handle it properly
    throw e;
  }
});
