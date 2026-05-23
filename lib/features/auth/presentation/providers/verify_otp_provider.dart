import 'package:flutter/material.dart';

import '../../../../app/controllers/auth_controllers.dart';
import '../../../../app/network_caller_set_up.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../data/models/user_model.dart';

class VerifyOtpProvider extends ChangeNotifier {
  bool isSuccess = false;

  bool? _verifyOtpProgress = false;
  bool? get verifyOtpProgress => _verifyOtpProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> verifyOtp({required String email, required String otp}) async {
    _verifyOtpProgress = true;
    notifyListeners();

    try {
      final NetworkResponse response = await getNetworkCaller().postRequest(
        Urls.verifyOtpUrl,
        body: {"email": email, "otp": otp},
      );

      if (response.isSuccess) {
        final UserModel user = UserModel.fromJson(
          response.body['data']['user'],
        );
        final String token = response.body['data']['token'];

        // save token and userdata
        await AuthControllers.saveUserData(token, user);

        _errorMessage = null;
        isSuccess = true;
      } else {
        _errorMessage = response.errorMessage;
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _verifyOtpProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
