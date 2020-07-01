import 'package:flutter/material.dart';
import 'screens/projects_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Title",   
      home: ProjectsScreen(),
      
    );
  }
}
