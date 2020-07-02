import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timeTracker/models/time_stamps.dart';
import '../models/project.dart';

class TimerScreen extends StatefulWidget {
  static const routeName = '/timer';

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

enum ButtonTimer {
  Play,
  Pause,
}

class _TimerScreenState extends State<TimerScreen> {
  final Duration _duration = const Duration(seconds: 1);
  final _form = GlobalKey<FormState>();
  DateTime _startTime;
  DateTime _endTime;
  ButtonTimer _startOrPause = ButtonTimer.Play;
  String _timeDisplay = "00:00:00";
  String _note;

  var _stopwatch = Stopwatch();

  void _startTimer() {
    Timer(_duration, _keepRunning);
  }

  void _keepRunning() {
    if (_stopwatch.isRunning) {
      _startTimer();
    }
    setState(
      () {
        _timeDisplay = _stopwatch.elapsed.inHours.toString().padLeft(2, "0") +
            ":" +
            (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
            ":" +
            (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
      },
    );
  }

  void _startStopwatch() {
    setState(() {
      _startOrPause = ButtonTimer.Pause;
    });
    _stopwatch.start();
    _startTimer();
  }

  void _stopStopwatch() {
    setState(() {
      _startOrPause =
          ButtonTimer.Play; //Change to play because timer was stopped
    });
    _stopwatch.stop();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final project = ModalRoute.of(context).settings.arguments as Project;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onLongPress: () {
                _stopwatch.reset();
                _stopwatch.stop();
                _startOrPause = ButtonTimer.Play;
              },
              child: Container(
                child: Center(
                  child: Text(
                    _timeDisplay,
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                color: Colors.pink,
                height: 1 * height / 3,
              ),
            ),
            Container(
              height: 1 * height / 3,
              color: Colors.pink,
              child: Form(
                key: _form,
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Note"),
                  maxLines: 5,
                  onSaved: (newValue) {
                    _note = newValue;
                  },
                ),
              ),
            ),
            Container(
              height: height / 3,
              color: Colors.pink,
              child: FlatButton(
                onLongPress: () {
                  if (_timeDisplay != "00:00:00") _form.currentState.save();
                  project.addTimeStamp(TimeStamps(
                      id: "AA1",
                      startTime: _startTime,
                      endTime: _endTime,
                      note: _note.length == 0 ? "..." : _note));
                  Navigator.of(context).pop();
                },
                onPressed: () {
                  if (_startOrPause == ButtonTimer.Play) {
                    _startTime = DateTime.now();
                    _startStopwatch();
                  } else if (_startOrPause == ButtonTimer.Pause) {
                    _endTime = DateTime.now();
                    _stopStopwatch();
                  }
                },
                child: _startOrPause == ButtonTimer.Play
                    ? Center(
                        child: Icon(
                          Icons.play_arrow,
                          size: 150,
                        ),
                      )
                    : Center(
                        child: Icon(
                          Icons.pause,
                          size: 150,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
