import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/modules.dart';

class ProjectScreen extends StatelessWidget {
  static const routeName = '/project';

  @override
  Widget build(BuildContext context) {
    final projectId = ModalRoute.of(context).settings.arguments as String;
    final selectedProject = Provider.of<Projects>(context).findProjectById(projectId);
    return Scaffold(
      appBar: AppBar(title: Text(selectedProject.title),
      backgroundColor: Theme.of(context).backgroundColor,),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150,
            color: Theme.of(context).primaryColor,
          ),

        ],
      ),
    );
  }
}