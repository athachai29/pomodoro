import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/models/time_model.dart';

class TimerProvider with ChangeNotifier {
  Timer _timer;
  bool _isCountingDown = false;
  int _start;
  Time _timeModel;

  TimerProvider() {
    this._timeModel = new Time();
    this._start = this._timeModel.focusTime;
  }

  bool get isCountingDown => this._isCountingDown;

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
}
