import 'package:flutter/foundation.dart';

import '../../../../app/crafty_bay_app.dart';
import '../../../../app/network_caller_set_up.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../../shared/presentation/widgets/snac_bar_message.dart';
import '../../data/models/cart_model.dart';

class CartListProvider extends ChangeNotifier {
  bool? _getInProgress = false;
  final List<CartModel> _carts = [];
  String? _errorMessage;

  bool get getInProgress => _getInProgress!;
  String? get getErrorMessage => _errorMessage;
  List<CartModel> get carts => _carts;

  Future<bool> getCarts() async {
    bool isSuccess = false;

    _getInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.getCartItemsUrl,
    );
    if (response.isSuccess) {
      List<CartModel> cartList = [];

      for (Map<String, dynamic> cart in response.body['data']['results']) {
        cartList.add(CartModel.fromJson(cart));
      }

      _carts.clear();
      _carts.addAll(cartList);

      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
      snackBarMessage(
        CraftyBayApp.navigatorKey.currentContext!,
        response.errorMessage,
        false,
      );
    }

    _getInProgress = false;
    notifyListeners();
    return isSuccess;
  }

  void changeQuantity(String cartId, int newQuantity) {
    int index = _carts.indexWhere((element) => element.id == cartId);
    if (index != -1) {
      _carts[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  double get totalPrice {
    double totalPrice = 0.0;
    for (CartModel cartModel in _carts) {
      totalPrice += cartModel.product.currentPrice * cartModel.quantity;
    }
    return totalPrice;
  }
}
