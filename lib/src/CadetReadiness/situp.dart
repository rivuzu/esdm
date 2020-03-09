import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SitUp extends StatefulWidget {
  @override
  State createState() => _SitUpState();
}

class _SitUpState extends State<SitUp> {
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
    return new Container(
      child: new Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Sit Up",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
          Icon(
            Icons.person,
            size: 170,
            color: Colors.blue,
          ),
          DottedBorder(
            borderType: BorderType.Circle,
            dashPattern: [3, 10],
            color: Colors.blue,
            strokeWidth: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DottedBorder(
                borderType: BorderType.Circle,
                dashPattern: [4, 16],
                strokeWidth: 3,
                color: Colors.blue,
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
                        color: Colors.blue,
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
          RaisedButton(
            onPressed: (){
              startTimer();
            },
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              // side: BorderSide(color: Colors.red)
            ),
            child: Text("Mulai", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
          )
        ],
      ),
    );
  }
}
