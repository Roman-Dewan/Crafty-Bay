import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;

  static final ThemeData _lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    brightness: .light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.themeColor,
      brightness: .light,
    ),
    progressIndicatorTheme: progressIndicatorTheme,
  );
  static final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    brightness: .dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.themeColor,
      brightness: .dark,
    ),
    progressIndicatorTheme: progressIndicatorTheme,
  );

  static ProgressIndicatorThemeData get progressIndicatorTheme =>
      ProgressIndicatorThemeData(color: AppColors.themeColor);
}
