import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryAccent = Color(0xFF566687); // emerald-500
  static const Color primaryDark = Color(0xFF047857); // emerald-700
  static const Color primaryLight = Color(0xFF34d399); // emerald-400
  static const Color primaryBg = Color(0xFFF9FAFB); // gray-50

  // Secondary Colors
  static const Color secondary = Color(0xFF566687); // blue-600
  static const Color secondaryDark = Color(0xFF1E40AF); // blue-800
  static const Color secondaryLight = Color(0xFF60A5FA); // blue-400

  // Text Colors
  static const Color textPrimary = Color(0xFF111827); // gray-900
  static const Color textSecondary = Color(0xFF6B7280); // gray-500
  static const Color textTertiary = Color(0xFF9CA3AF); // gray-400
  static const Color textWhite = Color(0xFFFFFFFF);

  // Background Colors
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color backgroundGray = Color(0xFFF3F4F6); // gray-100
  static const Color backgroundDark = Color(0xFF1F2937); // gray-800

  // Border Colors
  static const Color borderLight = Color(0xFFE5E7EB); // gray-200
  static const Color borderMedium = Color(0xFFD1D5DB); // gray-300
  static const Color borderDark = Color(0xFF9CA3AF); // gray-400

  // Status Colors
  static const Color success = Color(0xFF10B981); // green-500
  static const Color warning = Color(0xFFF59E0B); // amber-500
  static const Color error = Color(0xFFEF4444); // red-500
  static const Color info = Color(0xFF3B82F6); // blue-500

  // Shadow Colors
  static const Color shadowLight = Color(0x1A000000); // 10% black
  static const Color shadowMedium = Color(0x33000000); // 20% black
  static const Color shadowDark = Color(0x66000000); // 40% black

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryAccent, primaryDark],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, secondaryDark],
  );
}
