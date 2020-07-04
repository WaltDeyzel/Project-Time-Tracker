import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/modules.dart';
import '../widgets/projects_grid.dart';
import '../widgets/add_project.dart';

class ModuleScreen extends StatelessWidget {
  static const routeName = '/module';

  void _addProject(BuildContext context, String id) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return GestureDetector(
          onTap: () {},
          child: AddProject(id),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final projectId = ModalRoute.of(context).settings.arguments as String;
    final selectedModule =
        Provider.of<Modules>(context).findModuleById(projectId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedModule.title, style: TextStyle(fontSize: 40),),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: ProjectsGrid(selectedModule.getSubProjects()),
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _addProject(context, projectId);
        },
      ),
    );
  }
}
