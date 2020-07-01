import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectsGridTile extends StatelessWidget {
  final Project project;
  ProjectsGridTile(this.project);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: GridTile(
        child: Container(
          margin: EdgeInsets.only(left: 5, top: 5),
          child: Text(
            project.title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        footer: Container(
          margin: EdgeInsets.only(bottom: 5, left: 5),
          child: Text("Footer")),
      ),
    );
  }
}
