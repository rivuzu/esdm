import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Lari8 extends StatefulWidget {
  @override
  _Lari8State createState() => _Lari8State();
}

int _minute = 0;
int _seconds = 00;
String _zero = "0";
Timer _timer;
bool _timeRunning = false;
bool _resetTime = false;
bool buttonMulai = true;
bool buttonJeda = false;
bool rowJeda = false;

class _Lari8State extends State<Lari8> {
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.0953103, -115.1992098),
    zoom: 10,
  );

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_seconds == 59) {
            _minute = _minute + 1;
            _zero = "0";
            _seconds = 0;
          } else {
            if (_seconds >= 9) {
              _zero = "";
            }
            _seconds = _seconds + 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();
    // return new Stack(
    //   children: <Widget>[
    //     new Column(
    //       children: <Widget>[
    //         new Container(
    //             child: new Text(
    //           "$_minute:$_zero$_seconds",
    //           style: new TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 70.0,
    //               fontFamily: 'Roboto'),
    //         )),
    //         new Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: <Widget>[
    //             _timeRunning ? stopButton() : startButton(),
    //             _resetTime
    //                 ? new RaisedButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         _minute = 0;
    //                         _seconds = 0;
    //                         _zero = "0";
    //                         _resetTime = !_resetTime;
    //                       });
    //                     },
    //                     textColor: Colors.white,
    //                     color: Colors.blue[900],
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: new Text(
    //                       "Reset",
    //                     ),
    //                   )
    //                 : Container()
    //           ],
    //         )
    //       ],
    //     ),
    //     new Container(
    //         margin: EdgeInsets.only(top: 150),
    //         child: new GoogleMap(
    //           mapType: MapType.normal,
    //           initialCameraPosition: _kGooglePlex,
    //           onMapCreated: (GoogleMapController controller) {
    //             _controller.complete(controller);
    //           },
    //         ))
    //   ],
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
                  "Lari Angka 8",
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
            // Icon(
            //   Icons.person,
            //   size: 150,
            //   color: Colors.blue[900],
            // ),
            SvgPicture.asset("lib/assets/fonts/tracking.svg", color: Colors.blue[900], height: 120,),
            SizedBox(height: 20,),
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
          ],
        ),
      ),
    );
  }

  Widget startButton() {
    return new RaisedButton(
      onPressed: () {
        startTimer();
        _timeRunning = true;
      },
      textColor: Colors.white,
      color: Colors.blue[900],
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
          if (_seconds > 0 || _minute > 0) {
            _resetTime = true;
          }
          _timeRunning = false;
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
