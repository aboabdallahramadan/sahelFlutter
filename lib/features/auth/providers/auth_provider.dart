import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';
import '../models/register_request.dart';
import '../models/login_request.dart';
import '../models/verify_otp_request.dart';
import '../../../core/services/secure_storage_service.dart';

part 'auth_provider.freezed.dart';

// Auth state
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    UserModel? user,
    @Default(false) bool isLoading,
    @Default(false) bool isAuthenticated,
    String? error,
  }) = _AuthState;
}

// Auth notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;
  final SecureStorageService _storageService;

  AuthNotifier({
    required AuthService authService,
    required SecureStorageService storageService,
  })  : _authService = authService,
        _storageService = storageService,
        super(const AuthState()) {
    _checkAuthStatus();
  }

  // Check initial auth status
  Future<void> _checkAuthStatus() async {
    final isAuth = await _authService.isAuthenticated();
    if (isAuth) {
      // Try to restore user data from storage
      final userData = await _storageService.getUserData();
      if (userData != null) {
        try {
          final user = UserModel.fromJson(userData);
          state = state.copyWith(
            isAuthenticated: true,
            user: user,
          );
          return;
        } catch (e) {
          // If parsing fails, just set authenticated without user data
          print('Error parsing stored user data: $e');
        }
      }
    }
    state = state.copyWith(isAuthenticated: isAuth);
  }

  // Register
  Future<bool> register(String name, String phoneNumber) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final request = RegisterRequest(
        name: name,
        phoneNumber: phoneNumber,
      );

      final response = await _authService.register(request);

      if (response.success) {
        state = state.copyWith(
          isLoading: false,
          error: null,
        );
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.message,
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  // Login
  Future<bool> login(String phoneNumber) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final request = LoginRequest(phoneNumber: phoneNumber);
      final response = await _authService.login(request);

      if (response.success) {
        state = state.copyWith(
          isLoading: false,
          error: null,
        );
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.message,
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  // Verify OTP
  Future<bool> verifyOtp(String otp) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final userId = await _storageService.getUserId();
      if (userId == null) {
        state = state.copyWith(
          isLoading: false,
          error: 'User ID not found',
        );
        return false;
      }

      final request = VerifyOtpRequest(
        userId: userId,
        otp: otp,
      );

      final response = await _authService.verifyOtp(request);

      if (response.success && response.data != null) {
        state = state.copyWith(
          isLoading: false,
          isAuthenticated: true,
          user: response.data!.user,
          error: null,
        );
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.message,
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  // Logout
  Future<void> logout() async {
    await _authService.logout();
    state = const AuthState();
  }
}

// Provider for auth notifier
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  final storageService = ref.watch(secureStorageServiceProvider);
  return AuthNotifier(
    authService: authService,
    storageService: storageService,
  );
});
