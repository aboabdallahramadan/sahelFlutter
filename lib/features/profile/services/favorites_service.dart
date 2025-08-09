import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/api_response.dart';
import '../../../core/services/api_service.dart';
import '../../home/models/offers_response.dart';

class FavoritesService {
  final ApiService _apiService;

  FavoritesService({required ApiService apiService}) : _apiService = apiService;

  // Get user's favorite offers with pagination
  Future<ApiResponse<OffersResponse>> getMyFavorites({
    int? cursor,
    int limit = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'Limit': limit,
      };

      if (cursor != null) {
        queryParams['Cursor'] = cursor;
      }

      final response = await _apiService.dio.get(
        '/api/offers/my-favorites',
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
        message:
            e.response?.data['message'] ?? 'Failed to fetch favorite offers',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    }
  }

  // Add offer to favorites
  Future<ApiResponse<void>> addToFavorites(int offerId) async {
    try {
      final response = await _apiService.dio.post(
        '/api/offers/$offerId/favorite',
      );

      final apiResponse = ApiResponse<void>.fromJson(
        response.data,
        (_) {},
      );

      return apiResponse;
    } on DioException catch (e) {
      return ApiResponse<void>(
        data: null,
        success: false,
        message: e.response?.data['message'] ?? 'Failed to add to favorites',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    }
  }

  // Remove offer from favorites
  Future<ApiResponse<void>> removeFromFavorites(int offerId) async {
    try {
      final response = await _apiService.dio.delete(
        '/api/offers/$offerId/favorite',
      );

      final apiResponse = ApiResponse<void>.fromJson(
        response.data,
        (_) {},
      );

      return apiResponse;
    } on DioException catch (e) {
      return ApiResponse<void>(
        data: null,
        success: false,
        message:
            e.response?.data['message'] ?? 'Failed to remove from favorites',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    }
  }
}

// Provider for the favorites service
final favoritesServiceProvider = Provider<FavoritesService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return FavoritesService(apiService: apiService);
});
