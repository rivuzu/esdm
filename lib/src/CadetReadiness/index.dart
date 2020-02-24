import 'package:flutter/material.dart';

class CadetReadiness extends StatefulWidget{
  @override 
  State createState() => _CadetReadinessState();
}

class _CadetReadinessState extends State<CadetReadiness>{
  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Cadet Readiness'),
          backgroundColor: Colors.black,
        ),
    );
  }
}