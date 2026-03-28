import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/otp_verification_screen.dart';
import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSetting) {
    Widget widget = SizedBox();
    switch (routeSetting.name) {
      case SplashScreen.name:
        widget = const SplashScreen();
        break;
      case SignUpScreen.name:
        widget = const SignUpScreen();
        break;
      case OtpVerificationScreen.name:
        widget = const OtpVerificationScreen();
        break;
      case SignInScreen.name:
        widget = const SignInScreen();
        break;
      default:
    }
    return MaterialPageRoute(builder: (context) => widget);
  }
}
