import 'package:flutter/material.dart';
import '../models/time_stamps.dart';
import '../models/project.dart';
import '../screens/timer_screen.dart';

class TimeStampsScreen extends StatelessWidget {
  static const routeName = '/time-stamps';

  @override
  Widget build(BuildContext context) {
    final project =
        ModalRoute.of(context).settings.arguments as Project;
    final List<TimeStamps> timeStamps = project.getTimeStamps();
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Stamps"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: timeStamps.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 100,
            color: Colors.pink,
            child: Column(children: <Widget>[
              Text(
                timeStamps[index]
                        .endTime
                        .difference(timeStamps[index].startTime)
                        .inMinutes
                        .toString() +
                    " min",
              ),
              Divider(),
              Text(timeStamps[index].note),
            ]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.access_alarm), onPressed: () {
        Navigator.of(context).pushReplacementNamed(TimerScreen.routeName, arguments: project);
      },),
    );
  }
}
