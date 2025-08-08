import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/api_response.dart';
import '../../../core/services/api_service.dart';
import '../models/chat_creation_response.dart';

final chatServiceProvider = Provider<ChatService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ChatService(apiService.dio);
});

class ChatService {
  final Dio _dio;

  ChatService(this._dio);

  // Create or get chat with a user
  Future<ApiResponse<ChatCreationResponse>> createOrGetChat(int userId) async {
    try {
      final response = await _dio.get('/api/Chat/with-user/$userId');

      final apiResponse = ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => ChatCreationResponse.fromJson(json as Map<String, dynamic>),
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
}
