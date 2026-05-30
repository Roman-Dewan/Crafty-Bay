import 'package:flutter/foundation.dart';

import '../../../../app/network_caller_set_up.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../data/models/add_to_cart_model.dart';

class AddToCartProvider extends ChangeNotifier {
  bool _addToCartInProgress = false;
  String? _errorMessage;

  String? get errorMessage => _errorMessage;
  bool get addToCartInProgress => _addToCartInProgress;

  Future<bool> addToCart(AddToCartModel params) async {
    bool isSuccess = false;

    _addToCartInProgress = true;
    notifyListeners();

    try {
      final NetworkResponse response = await getNetworkCaller().postRequest(
        Urls.addToCartUrl,
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

    _addToCartInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
