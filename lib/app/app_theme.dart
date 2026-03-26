import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;

  static final ThemeData _lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.green.shade200,
  );
  static final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.red.shade200,
  );
}
