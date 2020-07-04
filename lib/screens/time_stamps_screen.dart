import 'package:flutter/material.dart';
import '../models/project.dart';
import '../widgets/time_stamp_tile.dart';
import '../screens/timer_screen.dart';

class TimeStampsScreen extends StatelessWidget {
  static const routeName = '/time-stamps';

  @override
  Widget build(BuildContext context) {
    final project = ModalRoute.of(context).settings.arguments as Project;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Stamps", style: TextStyle(fontSize: 40),),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: TimeStampTile(project),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_alarm),
        onPressed: () {
          Navigator.of(context)
              .pushReplacementNamed(TimerScreen.routeName, arguments: project);
        },
      ),
    );
  }
}