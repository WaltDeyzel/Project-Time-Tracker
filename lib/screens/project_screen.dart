import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
  static const routeName = '/project';

  @override
  Widget build(BuildContext context) {
    final projectId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text(projectId),),
      body: Text(""),
    );
  }
}