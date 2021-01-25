class Time {
  int focusTime = 1500;
  int shortBreakTime = 300;
  int longBreakTime = 900;

  void settingTimer(
    int focusTime,
    int shortBreakTime,
    int longBreakTime,
  ) {
    this.focusTime = focusTime * 60;
    this.shortBreakTime = shortBreakTime * 60;
    this.longBreakTime = longBreakTime * 60;
  }

  Map<String, double> getDefaultTimes() {
    return {
      'focusTime': this.focusTime / 60,
      'shortBreakTime': this.shortBreakTime / 60,
      'longBreakTime': this.longBreakTime / 60,
    };
  }
}
