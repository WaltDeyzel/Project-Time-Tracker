import 'package:flutter/material.dart';

import 'module.dart';

class Modules with ChangeNotifier{
  List<Module> _items = [
    Module(id: 'a1', time: 120.0, title: "Electronics", numberOfSubProjects: 3),
    Module(id: 'a2', time: 10.0, title: "Controls", numberOfSubProjects: 1),
    Module(id: 'a3', time: 320.0, title: "Emags", numberOfSubProjects: 4),
    Module(id: 'a4', time: 120.0, title: "Design", numberOfSubProjects: 3),
    Module(id: 'a5', time: 150.0, title: "Signals", numberOfSubProjects: 2),
  ];

  List<Module> get items {
    return [..._items]; //returns copy of _items into a new list
  }

  void addModule(Module add){
    _items.add(add);
    notifyListeners();
  }

  Module findModuleById(String projectId){
    return _items.firstWhere((element) => element.id == projectId);
  }

  void notify(){
    notifyListeners();
  }
}