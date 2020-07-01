import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/modules.dart';
import 'screens/projects_screen.dart';
import './screens/project_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Projects(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          backgroundColor: Colors.black,
          primaryColor: Color.fromARGB(0xFF, 128, 14, 28),),
        title: "Title",
        home: ProjectsScreen(),
        routes: {
          ProjectScreen.routeName: (ctx) => ProjectScreen(),
        },
      ),
    );
  }
}
