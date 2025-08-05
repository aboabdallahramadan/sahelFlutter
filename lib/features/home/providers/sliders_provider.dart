import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/home_service.dart';
import '../models/slider_model.dart';

// Sliders state provider
final slidersProvider = FutureProvider<List<SliderModel>>((ref) async {
  final homeService = ref.watch(homeServiceProvider);
  final response = await homeService.getSliders();

  if (response.success && response.data != null) {
    return response.data!;
  } else {
    throw Exception(response.message);
  }
});
