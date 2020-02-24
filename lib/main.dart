import 'dart:async';

import 'package:esdm/src/Home/index.dart';
import 'package:esdm/src/Login/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new ESDM());
}

class ESDM extends StatelessWidget{

  Route onGenerateRoute(RouteSettings settings) {
    Route page;
    switch (settings.name) {
      case "/login":
        page = CupertinoPageRoute(builder: (context) => Login());
        break;
        case "/home":
        page = CupertinoPageRoute(builder: (context) => Home());
        break;
    }
    return page;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "ESDM",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Color(0xff4158d0),
      ),
      home: new SplashScreen(),
      onGenerateRoute: onGenerateRoute,
      initialRoute: "/",
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Center(
        child: new Image.asset(
          'lib/assets/img/metrojaya.jpeg',
          width: 400.0,
          height: 300.0,
          ),
      ),
    );
  }
}
