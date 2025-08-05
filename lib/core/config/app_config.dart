class AppConfig {
  // API Configuration
  static const String apiBaseUrl =
      'http://192.168.1.104:5000'; // TODO: Replace with actual backend URL

  // Development mode
  static const bool isDevelopment = !bool.fromEnvironment('dart.vm.product');
}
