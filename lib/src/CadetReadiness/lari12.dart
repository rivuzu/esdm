import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Lari12 extends StatefulWidget {
  @override
  _Lari12State createState() => _Lari12State();
}

int _minute = 0;
int _seconds = 00;
String _zero = "0";
Timer _timer;
bool _timeRunning = false;
bool _resetTime = false;

class _Lari12State extends State<Lari12> {
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
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Container(
                child: new Text(
              "$_minute:$_zero$_seconds",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 70.0,
                  fontFamily: 'Roboto'),
            )),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _timeRunning ? stopButton() : startButton(),
                _resetTime
                    ? new RaisedButton(
                        onPressed: () {
                          setState(() {
                            _minute = 0;
                            _seconds = 0;
                            _zero = "0";
                            _resetTime = !_resetTime;
                          });
                        },
                        textColor: Colors.white,
                        color: Colors.blue,
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "Reset",
                        ),
                      )
                    : Container()
              ],
            )
          ],
        ),
        new Container(
            margin: EdgeInsets.only(top: 150),
            child: new GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ))
      ],
    );
  }

  Widget startButton() {
    return new RaisedButton(
      onPressed: () {
        startTimer();
        _timeRunning = true;
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
