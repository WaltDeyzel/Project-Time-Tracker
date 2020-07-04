import 'package:flutter/material.dart';
import '../models/project.dart';

class Module with ChangeNotifier {
  final String id;
  final String title;
  double time;
  int numberOfSubProjects;
  List<Project> _subProjects = [];

  Module({
    @required this.id,
    @required this.title,
    this.time = 0,
    this.numberOfSubProjects = 0,
  });

  List<Project> getSubProjects() {
    return _subProjects;
  }

  void addProject(Project add){
    _subProjects.add(add);
  }
}
