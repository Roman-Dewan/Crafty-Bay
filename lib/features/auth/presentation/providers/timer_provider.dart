import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  Timer? _timer;
  int _secondsRemaining = 15;

  int get secondsRemaining => _secondsRemaining;
  bool _isTimerRunning = false;
  bool get isTimerRunning => _isTimerRunning;

  void startTimer(int seconds) {
    if (_isTimerRunning) return;
    _timer?.cancel();
    _secondsRemaining = seconds;
    _isTimerRunning = true;
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _secondsRemaining--;
      notifyListeners();
      if (_secondsRemaining <= 0) {
        _timer?.cancel();
        _isTimerRunning = false;
        notifyListeners();
      }
    });
  }

  void resetTimer() {
    _secondsRemaining = 15;
    notifyListeners();
  }

  void cancelTimer() {
    _timer?.cancel();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
