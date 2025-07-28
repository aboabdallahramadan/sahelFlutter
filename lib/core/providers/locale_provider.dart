import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/locale_service.dart';

/// Provider for the current locale
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('en')) {
    _loadSavedLocale();
  }

  /// Load saved locale from SharedPreferences
  Future<void> _loadSavedLocale() async {
    final savedLocale = await LocaleService.getSavedLocale();
    if (savedLocale != null) {
      state = savedLocale;
    } else {
      // Use system locale if no saved preference
      state = LocaleService.getSystemLocale();
    }
  }

  /// Change the locale and save preference
  Future<void> changeLocale(Locale newLocale) async {
    state = newLocale;
    await LocaleService.saveLocale(newLocale);
  }

  /// Toggle between English and Arabic
  Future<void> toggleLocale() async {
    final newLocale =
        state.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    await changeLocale(newLocale);
  }

  /// Reset to system locale
  Future<void> resetToSystemLocale() async {
    await LocaleService.clearSavedLocale();
    state = LocaleService.getSystemLocale();
  }
}
