import 'package:flutter/material.dart';
import 'dart:async';

class SitUp extends StatefulWidget{
  @override 
  State createState() => _SitUpState();
}

class _SitUpState extends State<SitUp>{
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
  _timer.cancel();
  super.dispose();
}

Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
          title: new Text('Sit Up'),
          backgroundColor: Colors.black,
        ),
    body: Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            startTimer();
          },
          child: Text("start"),
        ),
        Text("$_start")
      ],
    ),
  );
}
}