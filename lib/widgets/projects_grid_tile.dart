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
        Navigator.of(context).pushNamed(TimeStampsScreen.routeName,
            arguments: project);
      },
      child: Container(
        color: Colors.white10,
        child: GridTile(
          child: Container(
            margin: const EdgeInsets.only(left: 5, top: 5),
            child: Text(
              project.title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300, color: Colors.white70),
            ),
          ),
          footer: Text('Time: ${project.totalProjectTime()%3600} sec', style: TextStyle(color: Colors.white70, fontFamily: 'Lato', fontSize: 15),),
        ),
      ),
    );
  }
}
