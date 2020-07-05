import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'module_screen.dart';
import '../models/modules.dart';
import '../widgets/module_tile.dart';
import '../widgets/add_module.dart';

class ModulesScreen extends StatelessWidget {
  void _addProject(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return GestureDetector(
          onTap: () {},
          child: AddModule(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final module = Provider.of<Modules>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Projects", style: TextStyle(fontSize: 40),),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: module.items.length == 0
            ? Text('Add some projects')
            : ListView.builder(
                itemCount: module.items.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              ModuleScreen.routeName,
                              arguments: module.items[index].id);
                        },
                        child: ProjectTile(
                          module.items[index].id,
                          module.items[index].title,
                          module.items[index].totalModuleTime(),
                          module.items[index].numberOfSubProjects(),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _addProject(context);
        },
      ),
    );
  }
}
