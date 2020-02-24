import 'package:flutter/material.dart';
import 'dart:async';

class CadetReadiness extends StatefulWidget{
  @override 
  State createState() => _CadetReadinessState();
}

enum FormType { login, register }

class _CadetReadinessState extends State<CadetReadiness>{

  bool visibilitySitUp = false;
  bool visibilityPushUp = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "SitUp"){
        visibilitySitUp = visibility;
      }
      if (field == "PushUp"){
        visibilityPushUp = visibility;
      }
    });
  }

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
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(backgroundColor: new Color(0xFF26C6DA)),
      body: new ListView(
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.all(20.0),
            // child: new FlutterLogo(size: 100.0, colors: Colors.blue),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 16.0, right: 16.0),
            child: new Column(
              children: <Widget>[
                visibilityPushUp ? new Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    
                    new Expanded(
                      flex: 11,
                      child:   RaisedButton(
                        onPressed: () {
                          startTimer();
                        },
                        child: Text("start"),
                      ), 
                    ),
                    new SizedBox(height: 24.0),
                    Text("$_start"),
                    new Expanded(
                      flex: 1,
                      child: new IconButton(
                        color: Colors.grey[400],
                        icon: const Icon(Icons.cancel, size: 22.0,),
                        onPressed: () {
                          _changed(false, "PushUp");
                        },
                      ),
                    ),
                  ],
                ) : new Container(),

                visibilitySitUp ? new Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Expanded(
                      flex: 11,
                      child: new TextField(
                        maxLines: 1,
                        style: Theme.of(context).textTheme.title,
                        decoration: new InputDecoration(
                          labelText: "SitUp",
                          isDense: true
                        ),
                      ),
                    ),
                    new Expanded(
                      flex: 1,
                      child: new IconButton(
                        color: Colors.grey[400],
                        icon: const Icon(Icons.cancel, size: 22.0,),
                        onPressed: () {
                          _changed(false, "SitUp");
                        },
                      ),
                    ),
                  ],
                ) : new Container(),
              ],
            )
          ),


          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new InkWell(
                onTap: () {
                  visibilityPushUp ? null : _changed(true, "PushUp");
                },
                child: new Container(
                  margin: new EdgeInsets.only(top: 16.0),
                  child: new Column(
                    children: <Widget>[
                      new Icon(Icons.comment, color: visibilityPushUp ? Colors.grey[400] : Colors.grey[600]),
                      new Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: new Text(
                          "Sit Up",
                          style: new TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: visibilityPushUp ? Colors.grey[400] : Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
              new SizedBox(width: 24.0),
              new InkWell(
                onTap: () {
                  visibilitySitUp ? null : _changed(true, "tag");
                },
                child: new Container(
                  margin: new EdgeInsets.only(top: 16.0),
                  child: new Column(
                    children: <Widget>[
                      new Icon(Icons.local_offer, color: visibilitySitUp ? Colors.grey[400] : Colors.grey[600]),
                      new Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: new Text(
                          "Push Up",
                          style: new TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: visibilitySitUp ? Colors.grey[400] : Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
              new SizedBox(width: 24.0),
              new InkWell(
                onTap: () {
                  visibilitySitUp ? null : _changed(true, "tag");
                },
                child: new Container(
                  margin: new EdgeInsets.only(top: 16.0),
                  child: new Column(
                    children: <Widget>[
                      new Icon(Icons.local_offer, color: visibilitySitUp ? Colors.grey[400] : Colors.grey[600]),
                      new Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: new Text(
                          "Push Up",
                          style: new TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: visibilitySitUp ? Colors.grey[400] : Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ],
          )                    
        ],
      )
    );
  }
}

// class _CadetReadinessState extends State<CadetReadiness>{
// Timer _timer;
// int _start = 0;

// void startTimer() {
//   const oneSec = const Duration(seconds: 1);
//   _timer = new Timer.periodic(
//     oneSec,
//     (Timer timer) => setState(
//       () {
//         if (_start < 0) {
//           timer.cancel();
//         } else {
//           _start = _start + 1;
//         }
//       },
//     ),
//   );
// }

// @override
// void dispose() {
//   _timer.cancel();
//   super.dispose();
// }

// Widget build(BuildContext context) {
//   return new Scaffold(
//     appBar: AppBar(title: Text("Cadet Readiness")),
//     backgroundColor: Colors.black,
//     body: Column(
//       children: <Widget>[
//         RaisedButton(
//           onPressed: () {
//             startTimer();
//           },
//           child: Text("start"),
//         ),
//         Text("$_start")
//       ],
//     ),
//   );
// }
// }