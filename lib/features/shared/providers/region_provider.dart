import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/region_service.dart';
import '../models/region_model.dart';

// Regions provider
final regionsProvider = FutureProvider<List<RegionModel>>((ref) async {
  final service = ref.watch(regionServiceProvider);
  final response = await service.getAllRegions();

  if (response.success && response.data != null) {
    return response.data!;
  } else {
    throw Exception(response.message);
  }
});
