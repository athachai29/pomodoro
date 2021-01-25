import 'package:flutter/material.dart';
import 'package:pomodoro/provider/timer_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _focusTime = 25;
  double _shortBreakTime = 5;
  double _longBreakTime = 15;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    var times =
        Provider.of<TimerProvider>(context, listen: false).getDefaultTimes();
    this._focusTime = times['focusTime'];
    this._shortBreakTime = times['shortBreakTime'];
    this._longBreakTime = times['longBreakTime'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Consumer<TimerProvider>(builder:
          (BuildContext context, TimerProvider provider, Widget child) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: this._formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Focus time: ${this._focusTime.round()}'),
                Slider(
                  value: this._focusTime,
                  min: 20,
                  max: 45,
                  divisions: 5,
                  label: this._focusTime.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      this._focusTime = value;
                    });
                  },
                ),
                Text('Short break: ${this._shortBreakTime.round()}'),
                Slider(
                  value: this._shortBreakTime,
                  min: 5,
                  max: 25,
                  divisions: 4,
                  label: this._shortBreakTime.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      this._shortBreakTime = value;
                    });
                  },
                ),
                Text('Long break: ${this._longBreakTime.round()}'),
                Slider(
                  value: this._longBreakTime,
                  min: 10,
                  max: 35,
                  divisions: 5,
                  label: this._longBreakTime.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      this._longBreakTime = value;
                    });
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      provider.settingTimer(
                        this._focusTime.round(),
                        this._shortBreakTime.round(),
                        this._longBreakTime.round(),
                      );
                    },
                    child: Text('Save change'),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
