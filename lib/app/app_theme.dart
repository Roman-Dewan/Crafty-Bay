import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;

  static final ThemeData _lightTheme = ThemeData(useMaterial3: true);
  static final ThemeData _darkTheme = ThemeData(useMaterial3: true);
}
