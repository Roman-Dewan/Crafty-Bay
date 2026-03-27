import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;

  // light mode
  static final ThemeData _lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    brightness: .light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.themeColor,
      brightness: .light,
    ),
    progressIndicatorTheme: progressIndicatorTheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: _filledButtonThemeData,
  );
  // dark mode
  static final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    brightness: .dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.themeColor,
      brightness: .dark,
    ),
    progressIndicatorTheme: progressIndicatorTheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: _filledButtonThemeData,
  );

  static ProgressIndicatorThemeData get progressIndicatorTheme =>
      ProgressIndicatorThemeData(color: AppColors.themeColor);

  // static TextTheme get _textTheme => TextTheme(
  //   titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //   titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //   titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //   bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  //   bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
  //   bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  // );

  static TextTheme get _textTheme {
    return TextTheme(titleLarge: TextStyle(fontWeight: .w700));
  }

  static FilledButtonThemeData get _filledButtonThemeData {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        fixedSize: Size.fromWidth(double.maxFinite),
        padding: EdgeInsets.symmetric(vertical: 14),
        backgroundColor: AppColors.themeColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }
}
