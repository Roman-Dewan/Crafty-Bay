import 'package:flutter/foundation.dart';

import '../../../../app/crafty_bay_app.dart';
import '../../../../app/network_caller_set_up.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../../shared/presentation/widgets/snac_bar_message.dart';
import '../../data/model/category_model.dart';

class CategoryListProvider extends ChangeNotifier {
  final int _pageSize = 30;
  int _currentPageNo = 1;
  int? _lastPage;

  bool? _getInitialCategoriesListInProgress = false;
  bool? _loadMoreCategoriesListInProgress = false;
  final List<CategoryModel> _categoriesList = [];
  String? _errorMessage;

  bool get getInitialCategoriesListInProgress =>
      _getInitialCategoriesListInProgress!;
  bool get loadMoreCategoriesListInProgress =>
      _loadMoreCategoriesListInProgress!;
  String? get getErrorMessage => _errorMessage;
  List<CategoryModel> get categoriesList => _categoriesList;

  bool get initialLoading => _currentPageNo == 1;

  Future<bool> getCategories() async {
    if (_getInitialCategoriesListInProgress == true ||
        _loadMoreCategoriesListInProgress == true) {
      return false;
    }

    bool isSuccess = false;
    if (_lastPage != null && _currentPageNo > _lastPage!) {
      return false;
    }
    if (initialLoading) {
      _getInitialCategoriesListInProgress = true;
    } else {
      _loadMoreCategoriesListInProgress = true;
    }
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.getCategoriesUrl(count: _pageSize, page: _currentPageNo),
    );
    if (response.isSuccess) {
      _lastPage = response.body['data']['last_page'] ?? _lastPage;
      debugPrint("last page - $_lastPage");
      debugPrint("total result - ${response.body['data']['total']}");

      List<CategoryModel> responseCategoryList = [];

      for (Map<String, dynamic> category in response.body['data']['results']) {
        responseCategoryList.add(CategoryModel.fromJson(category));
      }

      _categoriesList.addAll(responseCategoryList);

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
      _getInitialCategoriesListInProgress = false;
    } else {
      _loadMoreCategoriesListInProgress = false;
    }
    notifyListeners();
    _currentPageNo++;
    return isSuccess;
  }

  bool get loading =>
      getInitialCategoriesListInProgress || loadMoreCategoriesListInProgress;
}
