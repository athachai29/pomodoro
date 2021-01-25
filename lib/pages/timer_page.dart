import 'package:flutter/material.dart';
import 'package:pomodoro/provider/timer_provider.dart';
import 'package:provider/provider.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<TimerProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Consumer<TimerProvider>(
        builder: (BuildContext context, TimerProvider provider, Widget child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  provider.printDuration(),
                  style: TextStyle(
                    fontSize: 128,
                  ),
                ),
                provider.isCountingDown
                    ? InkWell(
                        onTap: () {
                          provider.stopTimer();
                        },
                        child: Icon(
                          Icons.stop_rounded,
                          size: 128,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          provider.startTimer();
                        },
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 128,
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
