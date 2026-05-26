import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/otp_verification_screen.dart';
import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/cart/presentation/screens/cart_screen.dart';
import '../features/category/data/model/category_model.dart';
import '../features/category/presentation/screens/category_screen.dart';
import '../features/home/presentation/screen/home_screen.dart';
import '../features/products/presentation/screens/create_review_screen.dart';
import '../features/products/presentation/screens/product_details_screen.dart';
import '../features/products/presentation/screens/product_list_screen.dart';
import '../features/products/presentation/screens/review_screen.dart';
import '../features/shared/presentation/screens/bottom_nav_bar.dart';
import '../features/wishlist/presentation/screens/wish_list_screen.dart';

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
        final email = routeSetting.arguments as String;
        widget = OtpVerificationScreen(email: email);
        break;
      case SignInScreen.name:
        widget = const SignInScreen();
        break;
      case BottomNavBar.name:
        widget = const BottomNavBar();
        break;
      case HomeScreen.name:
        widget = const HomeScreen();
        break;
      case CategoryScreen.name:
        widget = const CategoryScreen();
        break;
      case WishListScreen.name:
        widget = const WishListScreen();
        break;
      case ProductDetailsScreen.name:
        widget = const ProductDetailsScreen();
        break;
      case ProductListScreen.name:
        final category = routeSetting.arguments as CategoryModel;
        widget = ProductListScreen(category: category);
        break;
      case ReviewScreen.name:
        widget = const ReviewScreen();
        break;
      case CreateReviewScreen.name:
        widget = const CreateReviewScreen();
        break;
      case CartScreen.name:
        widget = const CartScreen();
        break;
      default:
    }
    return MaterialPageRoute(builder: (context) => widget);
  }
}
