import 'package:flutter/material.dart';
import '../models/project.dart';
import '../screens/time_stamps_screen.dart';

class ProjectsGridTile extends StatelessWidget {
  final Project project;
  ProjectsGridTile(this.project);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(TimeStampsScreen.routeName);
        },
          child: Container(
        color: Colors.pink,
        child: GridTile(
          child: Container(
            margin: EdgeInsets.only(left: 5, top: 5),
            child: Text(
              project.title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
