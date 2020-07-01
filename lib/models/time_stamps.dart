import 'package:flutter/material.dart';

class TimeStamps with ChangeNotifier{
  final String id;
  final DateTime startTime;
  final DateTime endTime;
  final String note;

  TimeStamps({
    @required this.id,
    @required this.startTime,
    @required this.endTime,
    @required this.note,
  });
}
