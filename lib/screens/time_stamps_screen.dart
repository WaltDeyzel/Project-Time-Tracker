import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/time_stamps.dart';
import '../models/project.dart';
import '../screens/timer_screen.dart';

class TimeStampsScreen extends StatelessWidget {
  static const routeName = '/time-stamps';

  @override
  Widget build(BuildContext context) {
    final project = ModalRoute.of(context).settings.arguments as Project;
    final List<TimeStamps> timeStamps = project.getTimeStamps();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Stamps", style: TextStyle(fontSize: 40),),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView.builder(
        itemCount: timeStamps.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white10,
            child: Column(children: <Widget>[
              Container(
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 5),
                        child: date(timeStamps[index])),
                    Container(
                        margin: EdgeInsets.only(right: 5),
                        child: duration(timeStamps[index])),
                  ],
                ),
              ),
              Divider(color: Colors.white,),
              Text(timeStamps[index].note, style: TextStyle(color: Colors.white, fontFamily: 'Lato'),),
              Divider(color: Colors.white, thickness: 2,),
            ]),
          );
        },
      ),
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

Widget duration(TimeStamps timeStamps) {
  Duration time = timeStamps.endTime.difference(timeStamps.startTime);
  if (time.inHours > 0)
    return Text(
      (time.inHours.toString() +
          "h " +
          (time.inMinutes % 60).toString() +
          "min " +
          (time.inSeconds % 60).toString() +
          "s"),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
    );
  return Text(
    ((time.inMinutes % 60).toString().padLeft(1, "0") +
        "min " +
        (time.inSeconds % 60).toString().padLeft(2, "0") +
        "s"),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
  );
}

Widget date(TimeStamps timeStamps) {
  return Text(
      DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY).format(timeStamps.endTime),
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),);
}
