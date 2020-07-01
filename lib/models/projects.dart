import 'package:flutter/material.dart';

import './project.dart';

class Projects with ChangeNotifier{
  List<Project> _items = [
    Project(id: 'a1', time: 120.0, title: "Electronics", numberOfSubProjects: 3),
    Project(id: 'a2', time: 10.0, title: "Controls", numberOfSubProjects: 1),
    Project(id: 'a3', time: 320.0, title: "Emags", numberOfSubProjects: 4),
    Project(id: 'a4', time: 120.0, title: "Design", numberOfSubProjects: 3),
    Project(id: 'a5', time: 150.0, title: "Signals", numberOfSubProjects: 2),
  ];

  List<Project> get items {
    return [..._items]; //returns copy of _items into a new list
  }

  void addProject(Project add){
    _items.add(add);
    notifyListeners();
  }

}