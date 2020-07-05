import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../models/time_stamps.dart';
import '../models/project.dart';
import '../models/modules.dart';

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
    final modules = Provider.of<Modules>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onLongPress: () {
                _stopwatch.reset();
                _stopwatch.stop();
                _startOrPause = ButtonTimer.Play;
              },
              child: Container(
                height: 2 * height / 5,
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Text(
                    _timeDisplay,
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              height: 1 * height / 5,
              child: Center(
                child: Form(
                  key: _form,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Note",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                    maxLines: 5,
                    onSaved: (newValue) {
                      _note = newValue;
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 2 * height / 5,
              child: Center(
                child: FlatButton(
                  onLongPress: () {
                    if (_timeDisplay != "00:00:00" &&
                        _startOrPause != ButtonTimer.Pause) {
                      _form.currentState.save();
                      project.addTimeStamp(TimeStamps(
                          id: project.id,
                          startTime: _startTime,
                          endTime: _endTime,
                          note: _note.length == 0 ? "..." : _note));
                      modules.notify();
                      Navigator.of(context).pop();
                    }
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
                            color: Colors.white,
                          ),
                        )
                      : Center(
                          child: Icon(
                            Icons.pause,
                            size: 150,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ), //
          ],
        ),
      ),
    );
  }
}
