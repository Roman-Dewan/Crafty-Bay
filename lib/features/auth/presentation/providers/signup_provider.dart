import 'package:crafty_bay/app/network_caller_set_up.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/signup_params.dart';

class SignupProvider extends ChangeNotifier {
  bool isSuccess = false;

  bool? _signUpProgress = false;
  bool? get signUpProgress => _signUpProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignupParams params) async {
    _signUpProgress = true;
    notifyListeners();

    try {
      final NetworkResponse response = await getNetworkCaller().postRequest(
        Urls.signUpUrl,
        body: params.toJson(),
      );

      if (response.isSuccess) {
        _errorMessage = null;
        isSuccess = true;
      } else {
        _errorMessage = response.errorMessage;
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _signUpProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
