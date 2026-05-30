import 'package:flutter/material.dart';

import '../../../../app/controllers/auth_controllers.dart';
import '../../../../app/network_caller_set_up.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../data/models/user_model.dart';

class SignInProvider extends ChangeNotifier {
  bool isSuccess = false;

  bool? _signInProgress = false;
  bool? get signInProgress => _signInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _successMessage;
  String? get successMessage => _successMessage;

  Future<bool> signIn({required String email, required String password}) async {
    _signInProgress = true;
    notifyListeners();

    try {
      final NetworkResponse response = await getNetworkCaller().postRequest(
        Urls.signInUrl,
        body: {"email": email, "password": password},
        isFromLogin: true,
      );

      if (response.isSuccess) {
        final UserModel user = UserModel.fromJson(
          response.body['data']['user'],
        );
        final String token = response.body['data']['token'];

        // save token and userdata
        await AuthControllers.saveUserData(token, user);

        _errorMessage = null;
        _successMessage = response.body['msg'];
        isSuccess = true;
      } else {
        _errorMessage = response.errorMessage;
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _signInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
