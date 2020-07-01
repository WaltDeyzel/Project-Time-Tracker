import 'package:flutter/material.dart';

class ProjectTile extends StatelessWidget {
  final String id;
  final String title;
  final double time;
  final int numberOfSubProjects;

  ProjectTile(this.id, this.title, this.time, this.numberOfSubProjects);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        height: 50,
        color: Colors.pinkAccent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10, top: 5),
              child: Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    time.toString(),
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                  Text(
                    numberOfSubProjects.toString(),
                    style: TextStyle(fontWeight: FontWeight.w200),
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
