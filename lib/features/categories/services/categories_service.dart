import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/api_response.dart';
import '../../../core/services/api_service.dart';
import '../models/categories_response.dart';

class CategoriesService {
  final ApiService _apiService;

  CategoriesService({required ApiService apiService})
      : _apiService = apiService;

  // Get categories tree
  Future<ApiResponse<CategoriesResponse>> getCategoriesTree({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await _apiService.dio.get(
        '/api/shared/categories/tree',
        queryParameters: {
          'Page': page,
          'PageSize': pageSize,
        },
      );

      final apiResponse = ApiResponse<CategoriesResponse>.fromJson(
        response.data,
        (json) => CategoriesResponse.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } on DioException catch (e) {
      return ApiResponse<CategoriesResponse>(
        data: null,
        success: false,
        message: e.response?.data['message'] ?? 'Failed to fetch categories',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    }
  }
}

// Provider for the categories service
final categoriesServiceProvider = Provider<CategoriesService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return CategoriesService(apiService: apiService);
});
