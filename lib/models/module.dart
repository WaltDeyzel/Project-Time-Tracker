import 'package:flutter/material.dart';
import '../models/project.dart';

class Module with ChangeNotifier{
  final String id;
  final String title;
  double time;
  int numberOfSubProjects;
  List<Project> _subProjects = [ 
    Project(id: "B", title: "Title"),
    Project(id: "B2", title: "Title2"),
    Project(id: "B3", title: "Title3"),
    
    ];

  Module({
    @required this.id,
    @required this.title,
    this.time = 0,
    this.numberOfSubProjects= 0,
  });

  List<Project> getSubProjects(){
    return _subProjects;
  }
}
