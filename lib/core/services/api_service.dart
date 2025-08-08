import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../providers/locale_provider.dart';
import '../config/app_config.dart';
import 'secure_storage_service.dart';
import '../../app.dart';

class ApiService {
  static const String baseUrl = AppConfig.apiBaseUrl;

  final Dio _dio;
  final SecureStorageService _storageService;
  final Ref _ref;

  ApiService({
    required SecureStorageService storageService,
    required Ref ref,
    Dio? dio,
  })  : _storageService = storageService,
        _ref = ref,
        _dio = dio ?? Dio() {
    _configureDio();
  }

  void _configureDio() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    // Add interceptors
    _dio.interceptors.add(_AuthInterceptor(_storageService, _ref));
    _dio.interceptors.add(_LanguageInterceptor(_ref));
    _dio.interceptors.add(_ErrorInterceptor(_ref));

    // Add logger in debug mode
    if (const bool.fromEnvironment('dart.vm.product') == false) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ));
    }
  }

  Dio get dio => _dio;
}

// Auth Interceptor to add bearer token
class _AuthInterceptor extends Interceptor {
  final SecureStorageService _storageService;
  final Ref _ref;

  _AuthInterceptor(this._storageService, this._ref);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Add token if available
    final token = await _storageService.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

// Language Interceptor to add Accept-Language header
class _LanguageInterceptor extends Interceptor {
  final Ref _ref;

  _LanguageInterceptor(this._ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final locale = _ref.read(localeProvider);
    options.headers['Accept-Language'] = locale.languageCode;
    handler.next(options);
  }
}

// Error Interceptor to handle 401 errors
class _ErrorInterceptor extends Interceptor {
  final Ref _ref;

  _ErrorInterceptor(this._ref);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Clear auth data and redirect to login
      _ref.read(secureStorageServiceProvider).clearAll();

      // Get the router from the navigator key
      final context = App.navigatorKey.currentContext;
      if (context != null && context.mounted) {
        context.goNamed('login');
      }

      // Don't propagate the error further since we've handled it
      return;
    }
    handler.next(err);
  }
}

// Provider for the API service
final apiServiceProvider = Provider<ApiService>((ref) {
  final storageService = ref.watch(secureStorageServiceProvider);
  return ApiService(storageService: storageService, ref: ref);
});
