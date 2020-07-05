import 'package:flutter/material.dart';

import 'module.dart';

class Modules with ChangeNotifier{
  List<Module> _items = [
    Module(id: 'a1', title: "Electronics"),
    Module(id: 'a2', title: "Controls"),
    Module(id: 'a3', title: "Emags"),
    Module(id: 'a4', title: "Design"),
    Module(id: 'a5', title: "Signals"),
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