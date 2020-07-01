import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/projects.dart';
import '../widgets/project_tile.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final projectData = Provider.of<Projects>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Projects"),
          backgroundColor: Colors.black45,
        ),
        backgroundColor: Colors.black45,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: projectData.items.length,
              itemBuilder: (_, index) {
                return Column(
                  children: <Widget>[
                    ProjectTile(
                        projectData.items[index].id,
                        projectData.items[index].title,
                        projectData.items[index].time,
                        projectData.items[index].numberOfSubProjects),
                    Divider(),
                  ],
                );
              }),
        ));
  }
}
