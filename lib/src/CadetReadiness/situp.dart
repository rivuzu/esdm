import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

class SitUp extends StatefulWidget {
  @override
  State createState() => _SitUpState();
}

class _SitUpState extends State<SitUp> {
  Timer _timer;
  int _start = 0;
  bool buttonMulai = true;
  bool buttonJeda = false;
  bool rowJeda = false;

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
                  "Sit Up",
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
            // Icon(
            //   Icons.person,
            //   size: 170,
            //   color: Colors.blue[900],
            // ),
            SvgPicture.asset("lib/assets/fonts/sit-up.svg", color: Colors.blue[900], height: 170,),
            DottedBorder(
              borderType: BorderType.Circle,
              dashPattern: [3, 10],
              color: Colors.blue[900],
              strokeWidth: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DottedBorder(
                  borderType: BorderType.Circle,
                  dashPattern: [4, 16],
                  strokeWidth: 3,
                  color: Colors.blue[900],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.transparent),
                      child: Center(
                          child: Text(
                        "$_start",
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 160.0,
                          fontFamily: 'Roboto',
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Visibility(
              visible: buttonMulai,
              child: RaisedButton(
                onPressed: () {
                  startTimer();
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
                      _start = 0;
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
          ],
        ),
      ),
    );
  }
}
