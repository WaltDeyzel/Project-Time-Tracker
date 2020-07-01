import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/project.dart';
import './projects_grid_tile.dart';

class ProjectsGrid extends StatelessWidget {

  final List<Project> projects;
  ProjectsGrid(this.projects);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value( // Use .value when dealing with lists or grids. When re using a existing object.
        value: projects[i], //change create to value if using .vlaue {It fixes bugs when widgets are off screen.}
        child: ProjectsGridTile(projects[i]),
      ),
    );
  }
}