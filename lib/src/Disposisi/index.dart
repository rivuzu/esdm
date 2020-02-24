import 'package:flutter/material.dart';

class Disposisi extends StatefulWidget{
  @override 
  State createState() => _DisposisiState();
}

class _DisposisiState extends State<Disposisi>{
  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Disposisi'),
          backgroundColor: Colors.black,
        ),
    );
  }
}