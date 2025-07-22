import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstants {
  // App Info
  static const String appName = 'Sahel';
  static const String appVersion = '1.0.0';

  // API Configuration
  static const String baseUrl = 'https://api.sahel.com/v1';
  static const Duration apiTimeout = Duration(seconds: 30);

  // Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String languageKey = 'language';
  static const String themeKey = 'theme';
  static const String onboardingKey = 'onboarding_completed';

  // Pagination
  static const int pageSize = 20;
  static const int maxPageSize = 100;

  // Image Upload
  static const int maxImageSize = 10 * 1024 * 1024; // 10 MB
  static const int maxImagesPerAd = 10;
  static const List<String> allowedImageFormats = [
    'jpg',
    'jpeg',
    'png',
    'webp'
  ];

  // OTP Configuration
  static const int otpLength = 6;
  static const Duration otpExpiry = Duration(minutes: 5);
  static const Duration otpResendDelay = Duration(seconds: 60);

  // Chat Configuration
  static const int maxMessageLength = 1000;
  static const Duration typingIndicatorDelay = Duration(seconds: 2);

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Base Constants (for const constructors)
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing40 = 40.0;
  static const double spacing48 = 48.0;

  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 12.0;
  static const double radiusXLarge = 16.0;
  static const double radiusXXLarge = 24.0;
  static const double radiusCircular = 9999.0;

  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeXLarge = 48.0;

  // Responsive versions (use these for responsive design)
  static double get spacing4R => 4.w;
  static double get spacing8R => 8.w;
  static double get spacing12R => 12.w;
  static double get spacing16R => 16.w;
  static double get spacing20R => 20.w;
  static double get spacing24R => 24.w;
  static double get spacing32R => 32.w;
  static double get spacing40R => 40.w;
  static double get spacing48R => 48.w;

  static double get radiusSmallR => 4.r;
  static double get radiusMediumR => 8.r;
  static double get radiusLargeR => 12.r;
  static double get radiusXLargeR => 16.r;
  static double get radiusXXLargeR => 24.r;
  static double get radiusCircularR => 9999.r;

  static double get iconSizeSmallR => 16.r;
  static double get iconSizeMediumR => 24.r;
  static double get iconSizeLargeR => 32.r;
  static double get iconSizeXLargeR => 48.r;

  // Country Codes
  static const List<Map<String, String>> countryCodes = [
    {'code': '+974', 'country': 'Qatar', 'flag': '🇶🇦'},
    {'code': '+966', 'country': 'Saudi Arabia', 'flag': '🇸🇦'},
    {'code': '+971', 'country': 'UAE', 'flag': '🇦🇪'},
    {'code': '+965', 'country': 'Kuwait', 'flag': '🇰🇼'},
    {'code': '+973', 'country': 'Bahrain', 'flag': '🇧🇭'},
    {'code': '+968', 'country': 'Oman', 'flag': '🇴🇲'},
  ];
}
