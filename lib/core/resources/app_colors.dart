import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary colors
  static const Color primaryLight = Color(0xFF3366FF);
  static const Color primaryDark = Color(0xFF5983FF);

  // Secondary colors
  static const Color secondaryLight = Color(0xFFFF6B6B);
  static const Color secondaryDark = Color(0xFFFF8585);

  // Background colors
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color backgroundDark = Color(0xFF121212);

  // Surface colors
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // Text colors
  static const Color textPrimaryLight = Color(0xFF212529);
  static const Color textPrimaryDark = Color(0xFFF8F9FA);
  static const Color textSecondaryLight = Color(0xFF6C757D);
  static const Color textSecondaryDark = Color(0xFFADB5BD);

  // Utility colors
  static const Color errorLight = Color(0xFFDC3545);
  static const Color errorDark = Color(0xFFEF5350);
  static const Color successLight = Color(0xFF28A745);
  static const Color successDark = Color(0xFF66BB6A);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryLight, Color(0xFF5983FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
