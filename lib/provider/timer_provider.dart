import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/models/time_model.dart';

class TimerProvider with ChangeNotifier {
  Timer _timer;
  bool _isCountingDown = false;
  int _start;
  Time _timeModel;
  var _times;

  TimerProvider() {
    this._timeModel = new Time();
    this._start = this._timeModel.focusTime;
  }

  bool get isCountingDown => this._isCountingDown;
  bool get times => this._times;

  String printDuration() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes =
        twoDigits(Duration(seconds: this._start).inMinutes.remainder(60));
    String twoDigitSeconds =
        twoDigits(Duration(seconds: this._start).inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void startTimer() {
    if (this._timer != null) {
      this._timer.cancel();
    }
    this._isCountingDown = true;
    this._timer = new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        if (this._start == 0) {
          this._start = this._timeModel.focusTime;
          this._isCountingDown = false;
          timer.cancel();
        } else {
          this._start--;
        }
        notifyListeners();
      },
    );
  }

  // void pauseTimer() {
  //   if (_timer != null) _timer.cancel();
  // }

  // void unpauseTimer() => startTimer(this._start);

  void stopTimer() {
    this._start = this._timeModel.focusTime;
    this._isCountingDown = false;
    this._timer.cancel();

    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();

    notifyListeners();
  }

  void settingTimer(
    int focusTime,
    int shortBreakTime,
    int longBreakTime,
  ) {
    this._timeModel.settingTimer(focusTime, shortBreakTime, longBreakTime);

    notifyListeners();
  }

  initData() {
    this._start = this._timeModel.focusTime;

    // notifyListeners();
  }

  Map<String, double> getDefaultTimes() {
    this._times = this._timeModel.getDefaultTimes();

    // notifyListeners();

    return this._times;
  }
}
