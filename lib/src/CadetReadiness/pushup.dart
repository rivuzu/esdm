import 'package:flutter/material.dart';
import 'dart:async';

class PushUp extends StatefulWidget {
  @override
  State createState() => _PushUpState();
}

class _PushUpState extends State<PushUp> {
  Timer _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 0) {
            timer.cancel();
          } else {
            _start = _start + 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "$_start",
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 160.0,
              fontFamily: 'Roboto',
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  startTimer();
                },
                child: new Text("Start"),
              ),
              new RaisedButton(
                onPressed: () {
                  dispose();
                },
                textColor: Colors.white,
                color: Colors.red,
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "Stop",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
