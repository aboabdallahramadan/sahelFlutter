class AppConfig {
  // API Configuration
  static const String apiBaseUrl = isDevelopment
      ? 'http://alaamohamad-001-site1.qtempurl.com' // Local development URL
      : 'http://alaamohamad-001-site1.qtempurl.com'; // TODO: Replace with your actual production API URL

  // Development mode
  static const bool isDevelopment = !bool.fromEnvironment('dart.vm.product');
}
