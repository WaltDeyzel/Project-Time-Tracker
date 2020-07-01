import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/time_stamps.dart';

class TimeStampsScreen extends StatelessWidget {
  static const routeName = '/time-stamps';

  @override
  Widget build(BuildContext context) {
    final timeStamps =
        ModalRoute.of(context).settings.arguments as List<TimeStamps>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Stamps"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: timeStamps.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.pink,
            child: Column(children: <Widget>[
              Text(
                DateFormat('dd/mm/yyyy hh:mm')
                    .format(timeStamps[index].startTime),
              ),
              Divider(),
              Text(timeStamps[index].note),
            ]),
          );
        },
      ),
    );
  }
}
