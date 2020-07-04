import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/project.dart';
import '../models/modules.dart';
import '../models/module.dart';

class AddProject extends StatefulWidget {
  final String id;
  AddProject(this.id);
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  final _form = GlobalKey<FormState>();

  var _newProject = Project(id: '', title: '');

  void _saveForm(Module module) {
    final isValid = _form.currentState.validate();
    if (!isValid) return;
    _form.currentState.save();
    module.addProject(_newProject);
  }

  @override
  Widget build(BuildContext context) {
    var modules = Provider.of<Modules>(context);
    var module = Provider.of<Modules>(context).findModuleById(widget.id);
    return Container(
      color: Colors.black87,
      child: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Title", //alot of options
              ),
              validator: (value) {
                if (value.isEmpty) return "Please add a Title.";
                return null;
              },
              onSaved: (newValue) {
                _newProject = Project(id: 'A', title: newValue);
              },
              onFieldSubmitted: (_) {
                _saveForm(module);
                modules.notify();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
