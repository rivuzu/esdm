import 'package:flutter/material.dart';
import 'dart:async';

class PullUp extends StatefulWidget {
  @override
  _PullUpState createState() => _PullUpState();
}

int _start = 0;
bool _filledNumber = false;
final _numberInput = TextEditingController();
int _numberTarget;
Timer _timer;

class _PullUpState extends State<PullUp> {
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            _filledNumber = false;
            timer.cancel();
          } else {
            _start = _start - 1;
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
      _numberTarget = _start;
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
                          hintText: "number",
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
                  "$_start",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 120.0,
                      fontFamily: 'Roboto'),
                )),
            _filledNumber
                ? Container(
                    child:
                        _start != _numberTarget ? stopButton() : startButton())
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
          _numberTarget = _start;
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
