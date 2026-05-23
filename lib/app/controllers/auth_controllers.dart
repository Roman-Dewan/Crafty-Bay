import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/models/user_model.dart';

class AuthControllers {
  static UserModel? userModel;
  static String? token;

  static const String _userKey = "user";
  static const String _tokenKey = "token";

  // save token and userdata
  static Future<void> saveUserData(
    String newToken,
    UserModel newUserModel,
  ) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_tokenKey, newToken);
    await preferences.setString(_userKey, jsonEncode(newUserModel.toJson()));

    userModel = newUserModel;
    token = newToken;
  }

  // get token and userdata
  static Future<void> getUserData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    token = preferences.getString(_tokenKey);
    final String? userData = preferences.getString(_userKey);

    if (userData != null) {
      userModel = UserModel.fromJson(jsonDecode(userData));
    }
  }

  // check user is logged in or not
  static Future<bool> isUserLoggedIn() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? savedToken = preferences.getString(_tokenKey);
    return (savedToken != null && savedToken.isNotEmpty);
  }

  // clear user token and userData
  static Future<void> clearUserData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(_tokenKey);
    await preferences.remove(_userKey);

    token = null;
    userModel = null;
  }
}
