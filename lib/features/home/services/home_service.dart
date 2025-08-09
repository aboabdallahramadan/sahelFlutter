import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/api_response.dart';
import '../../../core/services/api_service.dart';
import '../models/slider_model.dart';
import '../models/offers_response.dart';

class HomeService {
  final ApiService _apiService;

  HomeService({required ApiService apiService}) : _apiService = apiService;

  // Get sliders/banners
  Future<ApiResponse<List<SliderModel>>> getSliders() async {
    try {
      final response = await _apiService.dio.get('/api/customer/sliders');

      final apiResponse = ApiResponse<List<SliderModel>>.fromJson(
        response.data,
        (json) => (json as List<dynamic>)
            .map((item) => SliderModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } on DioException catch (e) {
      return ApiResponse<List<SliderModel>>(
        data: null,
        success: false,
        message: e.response?.data['message'] ?? 'Failed to fetch sliders',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    }
  }

  // Get offers with pagination
  Future<ApiResponse<OffersResponse>> getOffers(
      {int? cursor, int limit = 10}) async {
    try {
      final queryParams = <String, dynamic>{
        'Limit': limit,
      };

      if (cursor != null) {
        queryParams['Cursor'] = cursor;
      }

      final response = await _apiService.dio.get(
        '/api/offers',
        queryParameters: queryParams,
      );

      final apiResponse = ApiResponse<OffersResponse>.fromJson(
        response.data,
        (json) => OffersResponse.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } on DioException catch (e) {
      return ApiResponse<OffersResponse>(
        data: null,
        success: false,
        message: e.response?.data['message'] ?? 'Failed to fetch offers',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    }
  }

  // Get offers with filters and pagination
  Future<ApiResponse<OffersResponse>> getFilteredOffers({
    int? cursor,
    int limit = 10,
    int? categoryId,
    int? regionId,
    double? minPrice,
    double? maxPrice,
    String? searchTerm,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'Limit': limit,
      };

      if (cursor != null) {
        queryParams['Cursor'] = cursor;
      }
      if (categoryId != null) {
        queryParams['CategoryId'] = categoryId;
      }
      if (regionId != null) {
        queryParams['RegionId'] = regionId;
      }
      if (minPrice != null) {
        queryParams['MinPrice'] = minPrice;
      }
      if (maxPrice != null) {
        queryParams['MaxPrice'] = maxPrice;
      }
      if (searchTerm != null && searchTerm.isNotEmpty) {
        queryParams['SearchTerm'] = searchTerm;
      }

      final response = await _apiService.dio.get(
        '/api/offers',
        queryParameters: queryParams,
      );

      final apiResponse = ApiResponse<OffersResponse>.fromJson(
        response.data,
        (json) => OffersResponse.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } on DioException catch (e) {
      return ApiResponse<OffersResponse>(
        data: null,
        success: false,
        message: e.response?.data['message'] ?? 'Failed to fetch offers',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    }
  }
}

// Provider for the home service
final homeServiceProvider = Provider<HomeService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return HomeService(apiService: apiService);
});
