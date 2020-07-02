import 'package:flutter/material.dart';

class TimerScreen extends StatelessWidget {
  static const routeName = '/timer';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Center(child: Text("00:00:00", style: TextStyle(fontSize: 40),), ),
            color: Colors.amber,
            height: 400,
          ),
          Container(
            height: 283,
            color: Colors.amber,
            child: FlatButton(
              onPressed: null,
              child: Center(child: Icon(Icons.play_arrow, size: 150.0,),),
            ),
          ),
        ],
      ),
    );
  }
}
