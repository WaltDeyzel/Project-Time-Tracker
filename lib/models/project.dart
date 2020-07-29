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

  String totalTime(int seconds){
    int hours = (seconds/3600).floor();
    int min = ((seconds - 3600*hours)/60).floor();
    int sec = seconds - 3600*hours - min*60;
    
    return hours.toString().padLeft(0, '0') + ':' + min.toString().padLeft(0, '0') + ':' + sec.toString().padLeft(0, '0');
    
  }
}
