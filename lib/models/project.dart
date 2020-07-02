import 'package:flutter/material.dart';
import 'time_stamps.dart';

class Project with ChangeNotifier {
  final String id;
  final String title;
  double time;
  List<TimeStamps> _timeStamps = [
    
  ];

  Project({
    @required this.id,
    @required this.title,
    this.time = 0,
  });

  List<TimeStamps> getTimeStamps(){
    return _timeStamps;
  }

  void addTimeStamp(TimeStamps value){
    _timeStamps.add(value);
    notifyListeners();
  }
}
