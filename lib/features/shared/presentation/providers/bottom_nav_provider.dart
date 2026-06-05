import 'package:flutter/widgets.dart';

import '../../../../app/controllers/auth_controllers.dart';

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

  Future<bool> isAlreadyLogin() async {
    return await AuthControllers.isUserLoggedIn();
  }

  bool shouldVerifyLoginState(int index) {
    return index == 2 || index == 3;
  }
}
