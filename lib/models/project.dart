import 'package:flutter/material.dart';
import 'time_stamps.dart';

class Project with ChangeNotifier{
  final String id;
  final String title;
  double time;
  List<TimeStamps> records  = [];

  Project({
    @required this.id,
    @required this.title,
    this.time = 0,
  });
}
