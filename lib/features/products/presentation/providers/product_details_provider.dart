import 'package:crafty_bay/features/products/data/models/product_details_model.dart';
import 'package:flutter/material.dart';

import '../../../../app/network_caller_set_up.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';

class ProductDetailsProvider extends ChangeNotifier {
  String? _errorMessage;
  bool? _productDetailsInProgress = false;
  ProductDetailsModel? _productDetailsModel;

  String? get errorMessage => _errorMessage;
  ProductDetailsModel? get productDetailsModel => _productDetailsModel;
  bool? get productDetailsInProgress => _productDetailsInProgress;

  Future<bool> getProductDetails({required String productId}) async {
    bool isSuccess = false;
    _productDetailsInProgress = true;
    notifyListeners();

    try {
      final NetworkResponse response = await getNetworkCaller().getRequest(
        Urls.getProductDetailsUrl(productId: productId),
      );

      if (response.isSuccess) {
        _productDetailsModel = ProductDetailsModel.fromJson(response.body['data']);
        _errorMessage = null;
        isSuccess = true;
      } else {
        _errorMessage = response.errorMessage;
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _productDetailsInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
