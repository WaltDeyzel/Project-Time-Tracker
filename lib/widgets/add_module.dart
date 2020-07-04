import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/module.dart';
import '../models/modules.dart' ;

class AddModule extends StatefulWidget {
  @override
  _AddModuleState createState() => _AddModuleState();
}

class _AddModuleState extends State<AddModule> {
  var _newProject = Module(id: '', title: '');

  final _form = GlobalKey<FormState>();

  void _saveForm(Modules projects){
    final isValid = _form.currentState.validate();
    if(!isValid) return;
    _form.currentState.save();
    projects.addModule(_newProject);
    print(_newProject.title);
  }

  @override
  Widget build(BuildContext context) {
    var projects = Provider.of<Modules>(context);
    return Container(
      color: Colors.pink,
      child: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Title", //alot of options
              ),
              
              validator: (value){
                if(value.isEmpty)
                  return "Please add a Title.";
                return null;
              },
              onSaved: (newValue) {
                _newProject = Module(id: DateTime.now().toString(), title: newValue);
              },
              onFieldSubmitted: (_) {
                _saveForm(projects);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
