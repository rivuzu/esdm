import 'package:flutter/material.dart';
import 'dart:async';

class Renang extends StatefulWidget {
  @override
  _RenangState createState() => _RenangState();
}

int _start = 0;
int _minute = 0;
int _seconds = 00;
String _zero = "";
bool _filledNumber = false;
final _numberInput = TextEditingController();
String _tickerTime;
Timer _timer;

class _RenangState extends State<Renang> {
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_minute < 1 && _seconds < 1) {
            _filledNumber = false;
            timer.cancel();
          } else {
            if (_seconds == 00) {
              _minute = _minute - 1;
              _zero = "";
              _seconds = 59;
            } else {
              if (_seconds <= 10) {
                print(_seconds);
                _zero = "0";
              } else if (_seconds > 10) {
                _zero = "";
              }
              _seconds = _seconds - 1;
            }
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

  void onOkeButton() {
    setState(() {
      _start = int.parse(_numberInput.text);
      _minute = (_start / 60).floor();
      print(_minute);
      _seconds = _start - _minute * 60;
      _tickerTime = "$_minute:$_zero$_seconds";
      if (_seconds < 10) {
        print(_seconds);
        _zero = "0";
      } else if (_seconds > 10) {
        _zero = "";
      }
      if (_start != 0) {
        _filledNumber = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        alignment: Alignment.center,
        child: new Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(left: 30.0, right: 30.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Expanded(
                    child: new TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _numberInput,
                      style:
                          TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                      decoration: InputDecoration(
                          hintText: "seconds",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero)),
                    ),
                  ),
                  new Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: new RaisedButton(
                        onPressed: onOkeButton,
                        textColor: Colors.white,
                        color: Colors.red,
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "OK",
                        ),
                      ))
                ],
              ),
            ),
            new Container(
                margin: EdgeInsets.only(top: 50.0),
                child: new Text(
                  "$_minute:$_zero$_seconds",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 120.0,
                      fontFamily: 'Roboto'),
                )),
            _filledNumber
                ? Container(
                    child: "$_minute:$_zero$_seconds" != _tickerTime
                        ? stopButton()
                        : startButton())
                : Container()
          ],
        ),
      ),
    );
  }

  Widget startButton() {
    return new RaisedButton(
      onPressed: () {
        startTimer();
      },
      textColor: Colors.white,
      color: Colors.blue,
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        "Start",
      ),
    );
  }

  Widget stopButton() {
    return new RaisedButton(
      onPressed: () {
        setState(() {
          _tickerTime = "$_minute:$_zero$_seconds";
        });
        _timer.cancel();
      },
      textColor: Colors.white,
      color: Colors.red,
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        "Stop",
      ),
    );
  }
}
