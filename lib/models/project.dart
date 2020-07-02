import 'package:flutter/material.dart';
import 'time_stamps.dart';

class Project with ChangeNotifier {
  final String id;
  final String title;
  double time;
  List<TimeStamps> timeStamps = [
    TimeStamps(
      id: DateTime.now().toString(),
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      note: "This is a note",
    ),
    TimeStamps(
      id: DateTime.now().toString(),
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      note: "This is a note",
    ),
    TimeStamps(
      id: DateTime.now().toString(),
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      note: "This is a note",
    ),
    TimeStamps(
      id: DateTime.now().toString(),
      startTime: DateTime.now(),
      endTime: DateTime.parse("2020-07-02 09:09:04Z"),
      note: "This is a note",
    ),
  ];

  Project({
    @required this.id,
    @required this.title,
    this.time = 0,
  });

  List<TimeStamps> getTimeStamps(){
    return timeStamps;
  }
}
