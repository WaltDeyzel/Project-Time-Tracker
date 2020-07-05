import 'package:flutter/material.dart';
import '../models/project.dart';

class Module with ChangeNotifier {
  final String id;
  final String title;
  List<Project> _subProjects = [];

  Module({
    @required this.id,
    @required this.title,
  });

  List<Project> getSubProjects() {
    return _subProjects;
  }

  void addProject(Project add){
    _subProjects.add(add);
  }

  int numberOfSubProjects(){
    return _subProjects.length;
  }

  int totalModuleTime(){
    int total = 0;
    for(int i = 0; i<_subProjects.length; i++){
      total += _subProjects[i].totalProjectTime();
    }
    return total;
  }
}
