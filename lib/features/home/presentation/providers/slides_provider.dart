import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:crafty_bay/features/home/data/models/slide_model.dart';
import 'package:flutter/material.dart';

import '../../../../app/network_caller_set_up.dart';

class SlidesProvider extends ChangeNotifier {
  List<SlideModel> _slides = [];
  List<SlideModel> get slides => _slides;

  bool? _getSlidesProgress = false;
  bool? get getSlidesProgress => _getSlidesProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getHomeSlides() async {
    bool isSuccess = false;

    _getSlidesProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.slidesUrl,
    );

    if (response.isSuccess) {
      _slides.clear();
      List<SlideModel> tempSlides = [];
      final responseData = response.body['data'];
      if (responseData != null && responseData['results'] != null) {
        final List<dynamic> results = responseData['results'];
        for (var slider in results) {
          tempSlides.add(SlideModel.fromJson(slider as Map<String, dynamic>));
        }
      }
      _slides = tempSlides;
      _errorMessage = response.errorMessage;
      isSuccess = true;
    } else {
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }

    notifyListeners();
    _getSlidesProgress = false;
    return isSuccess;
  }
}
