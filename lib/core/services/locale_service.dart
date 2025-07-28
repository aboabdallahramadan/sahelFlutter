import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

class LocaleService {
  static const String _localeKey = AppConstants.languageKey;

  /// Save the locale to SharedPreferences
  static Future<void> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }

  /// Load the saved locale from SharedPreferences
  static Future<Locale?> getSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_localeKey);

    if (languageCode != null) {
      return Locale(languageCode);
    }

    return null;
  }

  /// Get system locale if it's supported, otherwise return default
  static Locale getSystemLocale() {
    final systemLocale = PlatformDispatcher.instance.locale;

    // Check if system locale is supported
    if (systemLocale.languageCode == 'ar' ||
        systemLocale.languageCode == 'en') {
      return systemLocale;
    }

    // Default to English if system locale is not supported
    return const Locale('en');
  }

  /// Clear saved locale
  static Future<void> clearSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_localeKey);
  }
}
