import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/api_response.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/secure_storage_service.dart';
import '../models/register_request.dart';
import '../models/login_request.dart';
import '../models/verify_otp_request.dart';
import '../models/user_model.dart';
import '../models/login_response.dart';
import '../models/verify_otp_response.dart';

class AuthService {
  final ApiService _apiService;
  final SecureStorageService _storageService;

  AuthService({
    required ApiService apiService,
    required SecureStorageService storageService,
  })  : _apiService = apiService,
        _storageService = storageService;

  // Register new user
  Future<ApiResponse<UserModel>> register(RegisterRequest request) async {
    try {
      final response = await _apiService.dio.post(
        '/api/User/register',
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<UserModel>.fromJson(
        response.data,
        (json) => UserModel.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.success && apiResponse.data != null) {
        // Save user ID for OTP verification
        await _storageService.saveUserId(apiResponse.data!.id);
      }

      return apiResponse;
    } on DioException catch (e) {
      return ApiResponse<UserModel>(
        data: null,
        success: false,
        message: e.response?.data['message'] ?? 'Registration failed',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    }
  }

  // Login existing user
  Future<ApiResponse<LoginResponse>> login(LoginRequest request) async {
    try {
      final response = await _apiService.dio.post(
        '/api/User/login',
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<LoginResponse>.fromJson(
        response.data,
        (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.success && apiResponse.data != null) {
        // Save user ID for OTP verification
        await _storageService.saveUserId(apiResponse.data!.userId);
      }

      return apiResponse;
    } on DioException catch (e) {
      return ApiResponse<LoginResponse>(
        data: null,
        success: false,
        message: e.response?.data['message'] ?? 'Login failed',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    }
  }

  // Verify OTP
  Future<ApiResponse<VerifyOtpResponse>> verifyOtp(
      VerifyOtpRequest request) async {
    try {
      final response = await _apiService.dio.post(
        '/api/User/verify-otp',
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<VerifyOtpResponse>.fromJson(
        response.data,
        (json) => VerifyOtpResponse.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.success && apiResponse.data != null) {
        // Save token and user data
        await _storageService.saveToken(apiResponse.data!.token);
        await _storageService
            .saveUserData(apiResponse.data!.user.toJson().toString());
      }

      return apiResponse;
    } on DioException catch (e) {
      return ApiResponse<VerifyOtpResponse>(
        data: null,
        success: false,
        message: e.response?.data['message'] ?? 'OTP verification failed',
        exception: e.toString(),
        stackTrace: e.stackTrace.toString(),
      );
    }
  }

  // Logout
  Future<void> logout() async {
    await _storageService.clearAll();
  }

  // Check if user is authenticated
  Future<bool> isAuthenticated() async {
    return await _storageService.isAuthenticated();
  }
}

// Provider for the auth service
final authServiceProvider = Provider<AuthService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  final storageService = ref.watch(secureStorageServiceProvider);
  return AuthService(
    apiService: apiService,
    storageService: storageService,
  );
});
