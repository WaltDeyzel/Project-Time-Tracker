import 'package:flutter/material.dart';

class Project with ChangeNotifier{
  final String id;
  final String title;
  double time;
  int numberOfSubProjects;

  Project({
    @required this.id,
    @required this.title,
    this.time = 0,
    this.numberOfSubProjects= 0,
  });
}
