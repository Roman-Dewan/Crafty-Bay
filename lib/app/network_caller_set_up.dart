import 'package:flutter/material.dart';

import '../core/services/network_caller.dart';
import '../features/auth/presentation/screens/sign_in_screen.dart';
import 'controllers/auth_controllers.dart';
import 'crafty_bay_app.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(
    headers: () {
      return {
        "content-type": "application/json",
        if (AuthControllers.token != null) "token": AuthControllers.token!,
      };
    },
    onUnauthorized: () {
      AuthControllers.clearUserData();
      _moveToSignInScreen();
    },
  );
}

void _moveToSignInScreen() {
  Navigator.pushNamed(
    CraftyBayApp.navigatorKey.currentContext!,
    SignInScreen.name,
  );
}
