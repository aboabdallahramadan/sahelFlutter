import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/api_response.dart';
import '../../../core/services/api_service.dart';
import '../models/ad_detail_response.dart';
import '../models/comments_response.dart';
import '../models/comment_model.dart';
import '../models/comment_request.dart';
import '../models/replies_response.dart';

final adsServiceProvider = Provider<AdsService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AdsService(apiService.dio);
});

class AdsService {
  final Dio _dio;

  AdsService(this._dio);

  // Get ad details
  Future<ApiResponse<AdDetailResponse>> getAdDetails(int adId) async {
    try {
      final response = await _dio.get('/api/offers/$adId');
      final apiResponse = ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => AdDetailResponse.fromJson(json as Map<String, dynamic>),
      );
      return apiResponse;
    } catch (e) {
      return ApiResponse(
        success: false,
        message: e.toString(),
        exception: '',
        stackTrace: '',
      );
    }
  }

  // Get comments for an offer
  Future<ApiResponse<CommentsResponse>> getComments({
    required int offerId,
    int? cursor,
    int limit = 20,
  }) async {
    try {
      final queryParams = {
        'Limit': limit,
        if (cursor != null) 'Cursor': cursor,
      };

      final response = await _dio.get(
        '/api/offers/$offerId/comments',
        queryParameters: queryParams,
      );

      final apiResponse = ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => CommentsResponse.fromJson(json as Map<String, dynamic>),
      );
      return apiResponse;
    } catch (e) {
      return ApiResponse(
        success: false,
        message: e.toString(),
        exception: '',
        stackTrace: '',
      );
    }
  }

  // Post a comment
  Future<ApiResponse<CommentModel>> postComment({
    required int offerId,
    required CommentRequest request,
  }) async {
    try {
      final response = await _dio.post(
        '/api/offers/$offerId/comments',
        data: request.toJson(),
      );

      final apiResponse = ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => CommentModel.fromJson(json as Map<String, dynamic>),
      );
      return apiResponse;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // Auth interceptor will handle the redirect
        throw e;
      }
      return ApiResponse(
        success: false,
        message: e.response?.data['message'] ?? e.toString(),
        exception: '',
        stackTrace: '',
      );
    } catch (e) {
      return ApiResponse(
        success: false,
        message: e.toString(),
        exception: '',
        stackTrace: '',
      );
    }
  }

  // Add/Remove favorite
  Future<ApiResponse<bool>> toggleFavorite(int offerId) async {
    try {
      final response = await _dio.post('/api/offers/$offerId/favorite');

      final apiResponse = ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => true,
      );
      return apiResponse;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // Auth interceptor will handle the redirect
        throw e;
      }
      return ApiResponse(
        success: false,
        message: e.response?.data['message'] ?? e.toString(),
        exception: '',
        stackTrace: '',
      );
    } catch (e) {
      return ApiResponse(
        success: false,
        message: e.toString(),
        exception: '',
        stackTrace: '',
      );
    }
  }

  // Get replies for a comment
  Future<ApiResponse<RepliesResponse>> getReplies({
    required int commentId,
    int? cursor,
    int limit = 20,
  }) async {
    try {
      final queryParams = {
        'Limit': limit,
        if (cursor != null) 'Cursor': cursor,
      };

      final response = await _dio.get(
        '/api/offers/comments/$commentId/replies',
        queryParameters: queryParams,
      );

      final apiResponse = ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => RepliesResponse.fromJson(json as Map<String, dynamic>),
      );
      return apiResponse;
    } catch (e) {
      return ApiResponse(
        success: false,
        message: e.toString(),
        exception: '',
        stackTrace: '',
      );
    }
  }
}
