import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/modules.dart';
import './screens/modules_screen.dart';
import './screens/time_stamps_screen.dart';
import './screens/module_screen.dart';
import './screens/timer_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Modules(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          backgroundColor: Colors.black,
          primaryColor: Color.fromARGB(0xFF, 128, 14, 28),),
        title: "Title",
        home: ModulesScreen(),
        routes: {
          ModuleScreen.routeName: (ctx) => ModuleScreen(),
          TimeStampsScreen.routeName: (ctx) => TimeStampsScreen(),
          TimerScreen.routeName: (ctx) =>TimerScreen(),
        },
      ),
    );
  }
}
