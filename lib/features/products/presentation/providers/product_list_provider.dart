import 'package:flutter/foundation.dart';

import '../../../../app/crafty_bay_app.dart';
import '../../../../app/network_caller_set_up.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../../shared/presentation/widgets/snac_bar_message.dart';
import '../../data/models/product_model.dart';

class ProductListProvider extends ChangeNotifier {
  final int _pageSize = 30;
  int _currentPageNo = 1;
  int? _lastPage;

  bool? _getInProgress = false;
  bool? _loadMoreProductsListInProgress = false;
  final List<ProductModel> _products = [];
  String? _errorMessage;

  bool get getInProgress => _getInProgress!;
  bool get loadMoreProductsListInProgress => _loadMoreProductsListInProgress!;
  String? get getErrorMessage => _errorMessage;
  List<ProductModel> get products => _products;

  bool get initialLoading => _currentPageNo == 1;

  Future<bool> getProducts({required String categoryId}) async {
    if (getInProgress == true || _loadMoreProductsListInProgress == true) {
      return false;
    }

    bool isSuccess = false;
    if (_lastPage != null && _currentPageNo > _lastPage!) {
      return false;
    }
    if (initialLoading) {
      _getInProgress = true;
    } else {
      _loadMoreProductsListInProgress = true;
    }
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.getProductsUrl(
        count: _pageSize,
        page: _currentPageNo,
        categoryId: categoryId,
      ),
    );
    if (response.isSuccess) {
      _lastPage = response.body['data']['last_page'] ?? _lastPage;

      List<ProductModel> productList = [];

      for (Map<String, dynamic> product in response.body['data']['results']) {
        productList.add(ProductModel.fromJson(product));
      }

      _products.addAll(productList);

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

    if (initialLoading) {
      _getInProgress = false;
    } else {
      _loadMoreProductsListInProgress = false;
    }
    notifyListeners();
    _currentPageNo++;
    return isSuccess;
  }

  bool get loading => getInProgress || loadMoreProductsListInProgress;
}
