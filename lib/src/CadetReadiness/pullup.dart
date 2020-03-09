import 'package:dotted_border/dotted_border.dart';
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
bool buttonMulai = true;
bool buttonJeda = false;
bool rowJeda = false;

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
    //                       hintText: "number",
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
    //               "$_start",
    //               style: new TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 120.0,
    //                   fontFamily: 'Roboto'),
    //             )),
    //         _filledNumber
    //             ? Container(
    //                 child:
    //                     _start != _numberTarget ? stopButton() : startButton())
    //             : Container()
    //       ],
    //     ),
    //   ),
    // );
    return new Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Pull Up",
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.blue[900],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
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
                        height: 300.0,
                        width: 300.0,
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
              SizedBox(
                height: 20.0,
              ),
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
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 16.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _numberInput,
                  decoration: InputDecoration(
                    hintText: '',
                    // filled: true,
                    prefixIcon: Icon(
                      Icons.timer,
                      size: 28.0,
                    ),
                    suffixIcon: RaisedButton(
                      color: Colors.blue,
                      child: Text("OK", style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        onOkeButton();
                        FocusScope.of(context).unfocus();
                      }
                    )
                  ),
                ),
              ),
            ],
          ),
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
