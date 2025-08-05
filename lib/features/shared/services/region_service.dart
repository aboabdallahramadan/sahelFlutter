import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/api_response.dart';
import '../../../core/services/api_service.dart';
import '../models/region_model.dart';

class RegionService {
  final ApiService _apiService;

  RegionService({required ApiService apiService}) : _apiService = apiService;

  // Get all regions
  Future<ApiResponse<List<RegionModel>>> getAllRegions() async {
    try {
      final response =
          await _apiService.dio.get('/api/SharedRegion/AllRegions');

      final apiResponse = ApiResponse<List<RegionModel>>.fromJson(
        response.data,
        (json) => (json as List<dynamic>)
            .map((item) => RegionModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } on DioException catch (e) {
      return ApiResponse<List<RegionModel>>(
        data: null,
        success: false,
        message: e.response?.data['message'] ?? 'Failed to fetch regions',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    }
  }
}

// Provider for the region service
final regionServiceProvider = Provider<RegionService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return RegionService(apiService: apiService);
});
