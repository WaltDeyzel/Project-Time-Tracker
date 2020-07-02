import 'dart:async';

import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  static const routeName = '/timer';

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final Duration _duration = const Duration(seconds: 1);
  bool _startOrPause = false;
  String _timeDisplay = "00:00:00";

  var _stopwatch = Stopwatch();

  void _startTimer(){
    Timer(_duration, _keepRunning);
  }

  void _keepRunning(){
    if(_stopwatch.isRunning){
      _startTimer();
    }
    setState(() {
      _timeDisplay = _stopwatch.elapsed.inHours.toString().padLeft(2, "0") + ":" +
      (_stopwatch.elapsed.inMinutes%60).toString().padLeft(2, "0") + ":" +
      (_stopwatch.elapsed.inSeconds%60).toString().padLeft(2, "0");
    });
  }
  void _startStopwatch(){
    setState(() {
      _startOrPause = false;
    });
    _stopwatch.start();
    _startTimer();
  }
  void _stopStopWatch(){
    setState(() {
      _startOrPause = true;
    });
    _stopwatch.stop();
    _stopwatch.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Center(child: Text(_timeDisplay, style: TextStyle(fontSize: 40),), ),
            color: Colors.amber,
            height: 400,
          ),
          Container(
            height: 283,
            color: Colors.amber,
            child: FlatButton(
              onPressed: (){
                if(_startOrPause)_startStopwatch();
                else _stopStopWatch();
              },
              child: Center(child: _startOrPause ? Icon(Icons.play_arrow, size: 150.0,) : Icon(Icons.pause, size: 150.0,) ,),
            ),
          ),
        ],
      ),
    );
  }
}
