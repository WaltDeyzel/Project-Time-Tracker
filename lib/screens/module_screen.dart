import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/modules.dart';
import '../widgets/projects_grid.dart';

class ModuleScreen extends StatelessWidget {
  static const routeName = '/module';

  @override
  Widget build(BuildContext context) {
    final projectId = ModalRoute.of(context).settings.arguments as String;
    final selectedModule =
        Provider.of<Modules>(context).findModuleById(projectId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedModule.title),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: ProjectsGrid(selectedModule.getSubProjects()),
      backgroundColor: Colors.black,
    );
  }
}
