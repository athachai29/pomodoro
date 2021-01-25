import 'package:flutter/material.dart';
import 'package:pomodoro/pages/history_page.dart';
import 'package:pomodoro/pages/settings_page.dart';
import 'package:pomodoro/pages/timer_page.dart';
import 'package:pomodoro/provider/timer_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(
          create: (BuildContext context) => TimerProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Pomodoro',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Pomodoro'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            TimerPage(),
            HistoryPage(),
            SettingsPage(),
          ],
        ),
        backgroundColor: Colors.red,
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.access_alarm_rounded),
              text: 'Timer',
            ),
            Tab(
              icon: Icon(Icons.history),
              text: 'History',
            ),
            Tab(
              icon: Icon(Icons.settings),
              text: 'Settings',
            )
          ],
        ),
      ),
    );
  }
}
