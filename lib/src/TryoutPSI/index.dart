import 'package:flutter/material.dart';

class TryoutPSI extends StatefulWidget{
  @override 
  State createState() => _TryoutPSIState();
}

class _TryoutPSIState extends State<TryoutPSI>{
  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Tryout PSI'),
          backgroundColor: Colors.black,
        ),
    );
  }
}