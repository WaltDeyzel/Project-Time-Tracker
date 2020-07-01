import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeStampsScreen extends StatelessWidget {
  static const routeName = '/time-stamps';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Time Stamps"),),
    );
  }
}
