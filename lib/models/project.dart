import 'package:flutter/material.dart';
import 'time_stamps.dart';

class Project with ChangeNotifier {
  final String id;
  final String title;
  List<TimeStamps> _timeStamps = [
    
  ];

  Project({
    @required this.id,
    @required this.title,
  });

  List<TimeStamps> getTimeStamps(){
    return _timeStamps;
  }

  void addTimeStamp(TimeStamps value){
    _timeStamps.add(value);
    notifyListeners();
  }

  int totalProjectTime(){
    int total = 0;
    for(int i = 0; i<_timeStamps.length; i++){
      total += _timeStamps[i].timeLapsed();
    }
    return total;
  }
}
