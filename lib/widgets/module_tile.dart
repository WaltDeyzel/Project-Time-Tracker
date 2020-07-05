import 'package:flutter/material.dart';

class ProjectTile extends StatelessWidget {
  final String id;
  final String title;
  final int time;
  final int numberOfSubProjects;

  ProjectTile(this.id, this.title, this.time, this.numberOfSubProjects);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        height: 100,
        color: Colors.white10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    time.toString(),
                    style: TextStyle(fontWeight: FontWeight.w200, color: Colors.white),
                  ),
                  Text(
                    numberOfSubProjects.toString(),
                    style: TextStyle(fontWeight: FontWeight.w200, color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
