import 'package:flutter/widgets.dart';

class BottomNavProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void moveToCategoryScreen() {
    _selectedIndex = 1;
    notifyListeners();
  }
  void moveToHomeScreen() {
    _selectedIndex = 0;
    notifyListeners();
  }
}