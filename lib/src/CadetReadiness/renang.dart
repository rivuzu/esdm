import 'package:dotted_border/dotted_border.dart';
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
bool _timeRunning = false;
bool _resetTime = false;
bool buttonMulai = true;
bool buttonJeda = false;
bool rowJeda = false;

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
    // return new Center(
    //   child: new Container(
    //     alignment: Alignment.center,
    //     child: new Column(
    //       children: <Widget>[
    //         new Container(
    //           margin: EdgeInsets.only(left: 30.0, right: 30.0),
    //           child: new Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: <Widget>[
    //               new Expanded(
    //                 child: new TextFormField(
    //                   keyboardType: TextInputType.number,
    //                   controller: _numberInput,
    //                   style:
    //                       TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
    //                   decoration: InputDecoration(
    //                       hintText: "seconds",
    //                       border: OutlineInputBorder(
    //                           borderRadius: BorderRadius.zero)),
    //                 ),
    //               ),
    //               new Container(
    //                   margin: EdgeInsets.only(left: 10.0),
    //                   child: new RaisedButton(
    //                     onPressed: onOkeButton,
    //                     textColor: Colors.white,
    //                     color: Colors.red,
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: new Text(
    //                       "OK",
    //                     ),
    //                   ))
    //             ],
    //           ),
    //         ),
    //         new Container(
    //             margin: EdgeInsets.only(top: 50.0),
    //             child: new Text(
    //               "$_minute:$_zero$_seconds",
    //               style: new TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 120.0,
    //                   fontFamily: 'Roboto'),
    //             )),
    //         _filledNumber
    //             ? Container(
    //                 child: "$_minute:$_zero$_seconds" != _tickerTime
    //                     ? stopButton()
    //                     : startButton())
    //             : Container()
    //       ],
    //     ),
    //   ),
    // );
    return new Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Berenang",
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Icon(
              Icons.person,
              size: 150,
              color: Colors.blue[900],
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(8.0),
              strokeWidth: 2,
              dashPattern: [5, 8],
              color: Colors.blue[900],
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "$_minute",
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.w900,
                          fontSize: 60.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        "Min",
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 45.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        "$_zero$_seconds",
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.w900,
                          fontSize: 60.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        "Sec",
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 45.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Visibility(
              visible: buttonMulai,
              child: RaisedButton(
                onPressed: () {
                  startTimer();
                  _timeRunning = true;
                  setState(() {
                    buttonMulai = false;
                  });
                  setState(() {
                    buttonJeda = true;
                  });
                  setState(() {
                    rowJeda = false;
                  });
                },
                color: Colors.blue[900],
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  // side: BorderSide(color: Colors.red)
                ),
                child: Text(
                  "Mulai",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: buttonJeda,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    buttonMulai = false;
                  });
                  setState(() {
                    buttonJeda = false;
                  });
                  setState(() {
                    rowJeda = true;
                  });
                  _timer.cancel();
                  _timeRunning = false;
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  // side: BorderSide(color: Colors.red)
                ),
                child: Text(
                  "Jeda",
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: rowJeda,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        buttonMulai = false;
                      });
                      setState(() {
                        buttonJeda = true;
                      });
                      setState(() {
                        rowJeda = false;
                      });
                      startTimer();
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      // side: BorderSide(color: Colors.red)
                    ),
                    child: Text(
                      "Lanjutkan",
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        buttonMulai = true;
                      });
                      setState(() {
                        buttonJeda = false;
                      });
                      setState(() {
                        rowJeda = false;
                      });
                      setState(() {
                        _zero = "0";
                        _minute = 0;
                        _seconds = 00;
                        _timeRunning = false;
                      });
                    },
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      // side: BorderSide(color: Colors.red)
                    ),
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _numberInput,
                decoration: InputDecoration(
                    hintText: 'Detik',
                    // filled: true,
                    prefixIcon: Icon(
                      Icons.timer,
                      size: 28.0,
                    ),
                    suffixIcon: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          onOkeButton();
                          FocusScope.of(context).unfocus();
                        })),
              ),
            ),
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
