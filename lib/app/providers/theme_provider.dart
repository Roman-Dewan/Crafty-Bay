import 'package:crafty_bay/app/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = AppTheme.lightTheme;

  ThemeData get themeData => _themeData;

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == AppTheme.lightTheme) {
      setTheme(AppTheme.darkTheme);
    } else {
      setTheme(AppTheme.lightTheme);
    }
    notifyListeners();
  }
}
