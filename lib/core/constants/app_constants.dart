class AppConstants {
  // App Info
  static const String appName = 'Mzad Qatar';
  static const String appVersion = '1.0.0';
  
  // API Configuration
  static const String baseUrl = 'https://api.mzadqatar.com/v1';
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
  static const List<String> allowedImageFormats = ['jpg', 'jpeg', 'png', 'webp'];
  
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
  
  // Spacing
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing40 = 40.0;
  static const double spacing48 = 48.0;
  
  // Border Radius
  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 12.0;
  static const double radiusXLarge = 16.0;
  static const double radiusXXLarge = 24.0;
  static const double radiusCircular = 9999.0;
  
  // Icon Sizes
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeXLarge = 48.0;
  
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