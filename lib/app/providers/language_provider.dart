import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = Locale('en');
  Locale get currentLocale => _currentLocale;

  void changeLocale(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
  }

  final List<Locale> _supportedLocales = [Locale('en'), Locale('bn')];
  List<Locale> get supportedLocales => _supportedLocales;
}
