import 'dart:io';
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
        rethrow;
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
        rethrow;
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

  // Create a new offer (ad)
  Future<ApiResponse<bool>> createOffer({
    required String name,
    required String description,
    required double price,
    required int categoryId,
    required int regionId,
    required List<File> images,
  }) async {
    try {
      final formData = FormData();

      formData.fields
        ..add(MapEntry('Name', name))
        ..add(MapEntry('Description', description))
        ..add(MapEntry('Price', price.toString()))
        ..add(MapEntry('CategoryId', categoryId.toString()))
        ..add(MapEntry('RegionId', regionId.toString()));

      for (final file in images) {
        final fileName = file.path.split(Platform.pathSeparator).last;
        formData.files.add(
          MapEntry(
            'Images',
            await MultipartFile.fromFile(
              file.path,
              filename: fileName,
            ),
          ),
        );
      }

      final response = await _dio.post(
        '/api/offers/create',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      final apiResponse = ApiResponse<bool>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => true,
      );

      return apiResponse;
    } on DioException catch (e) {
      return ApiResponse<bool>(
        data: null,
        success: false,
        message: e.response?.data is Map<String, dynamic>
            ? (e.response?.data['message'] as String? ??
                'Failed to create offer')
            : 'Failed to create offer',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    } catch (e, st) {
      return ApiResponse<bool>(
        data: null,
        success: false,
        message: e.toString(),
        exception: e.toString(),
        stackTrace: st.toString(),
      );
    }
  }
}
