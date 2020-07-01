import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/projects.dart';
import '../widgets/project_tile.dart';
import '../widgets/add_project.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {

  void _addProject(BuildContext context){
    showModalBottomSheet(context: context, builder: (ctx) {
      return GestureDetector(
        onTap: (){},
        child: AddProject(),
        behavior: HitTestBehavior.opaque,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    final projectData = Provider.of<Projects>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Projects"),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
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
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          _addProject(context);
        },
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
