import 'package:flutter/material.dart';

class Catpers extends StatefulWidget{
  @override 
  State createState() => _CatpersState();
}

class _CatpersState extends State<Catpers>{
  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Catpers'),
          backgroundColor: Colors.black,
        ),
    );
  }
}