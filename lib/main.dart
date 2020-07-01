import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/projects.dart';
import 'screens/projects_screen.dart';

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
        title: "Title",   
        home: ProjectsScreen(),
        
      ),
    );
  }
}
