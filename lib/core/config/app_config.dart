class AppConfig {
  // API Configuration
  static const String apiBaseUrl = isDevelopment
      ? 'http://192.168.1.104:5000' // Local development URL
      : 'http://192.168.1.104:5000'; // TODO: Replace with your actual production API URL

  // Development mode
  static const bool isDevelopment = !bool.fromEnvironment('dart.vm.product');
}
