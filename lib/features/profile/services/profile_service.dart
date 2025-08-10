import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/api_response.dart';
import '../../../core/services/api_service.dart';
import '../models/user_profile.dart';

class ProfileService {
  final ApiService _apiService;

  ProfileService({required ApiService apiService}) : _apiService = apiService;

  // Get current user profile
  Future<ApiResponse<UserProfile>> getCurrentUserProfile() async {
    try {
      final response = await _apiService.dio.get('/api/User/profile');

      final apiResponse = ApiResponse<UserProfile>.fromJson(
        response.data,
        (json) => UserProfile.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } on DioException catch (e) {
      return ApiResponse<UserProfile>(
        data: null,
        success: false,
        message: e.response?.data['message'] ?? 'Failed to fetch profile',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    }
  }

  // Get user profile by ID
  Future<ApiResponse<UserProfile>> getUserProfile(int userId) async {
    try {
      final response = await _apiService.dio.get('/api/User/profile/$userId');

      final apiResponse = ApiResponse<UserProfile>.fromJson(
        response.data,
        (json) => UserProfile.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse;
    } on DioException catch (e) {
      return ApiResponse<UserProfile>(
        data: null,
        success: false,
        message: e.response?.data['message'] ?? 'Failed to fetch user profile',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    }
  }

  // Toggle follow/unfollow user
  Future<ApiResponse<void>> toggleFollowUser(int userId) async {
    try {
      final response =
          await _apiService.dio.post('/api/followers/toggle/$userId');

      final apiResponse = ApiResponse<void>.fromJson(
        response.data,
        (_) => null,
      );

      return apiResponse;
    } on DioException catch (e) {
      return ApiResponse<void>(
        data: null,
        success: false,
        message:
            e.response?.data['message'] ?? 'Failed to toggle follow status',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    }
  }
}

// Provider for the profile service
final profileServiceProvider = Provider<ProfileService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ProfileService(apiService: apiService);
});
