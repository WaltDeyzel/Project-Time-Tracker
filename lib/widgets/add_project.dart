import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/project.dart';
import '../models/projects.dart' ;

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  var _newProject = Project(id: '', title: '');

  final _form = GlobalKey<FormState>();

  void _saveForm(Projects projects){
    final isValid = _form.currentState.validate();
    if(!isValid) return;
    _form.currentState.save();
    projects.addProject(_newProject);
    print(_newProject.title);
  }

  @override
  Widget build(BuildContext context) {
    var projects = Provider.of<Projects>(context);
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
                _newProject = Project(id: 'A', title: newValue);
              },
              onFieldSubmitted: (_) {
                _saveForm(projects);
              },
            ),
          ],
        ),
      ),
    );
  }
}
