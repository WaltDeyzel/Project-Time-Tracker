import 'package:flutter/material.dart';

class Module with ChangeNotifier{
  final String id;
  final String title;
  double time;
  int numberOfSubProjects;

  Module({
    @required this.id,
    @required this.title,
    this.time = 0,
    this.numberOfSubProjects= 0,
  });
}
