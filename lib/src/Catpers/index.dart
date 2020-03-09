import 'package:esdm/src/Catpers/listnama.dart';
import 'package:esdm/src/Catpers/listsubmit.dart';
import 'package:esdm/src/Catpers/submitpelanggaran.dart';
import 'package:flutter/material.dart';

class Catpers extends StatefulWidget {
  @override
  State createState() => _CatpersState();
}

class _CatpersState extends State<Catpers> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Catpers'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Material(
                  // <----------------------------- Outer Material
                  shadowColor: Colors.grey[50],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  elevation: 6.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: AlignmentDirectional.bottomStart,
                        end: AlignmentDirectional.topEnd,
                        colors: [
                          Colors.orange,
                          Colors.pink,
                        ],
                      ),
                    ),
                    child: Material(
                      // <------------------------- Inner Material
                      type: MaterialType.transparency,
                      elevation: 6.0,
                      color: Colors.transparent,
                      shadowColor: Colors.grey[50],
                      child: InkWell(
                        //<------------------------- InkWell
                        splashColor: Colors.white30,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ListNama()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.account_circle,
                                size: 40.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Daftar Nama",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Material(
                  // <----------------------------- Outer Material
                  shadowColor: Colors.grey[50],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  elevation: 6.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: AlignmentDirectional.bottomStart,
                        end: AlignmentDirectional.topEnd,
                        colors: [
                          Colors.orange,
                          Colors.pink,
                        ],
                      ),
                    ),
                    child: Material(
                      // <------------------------- Inner Material
                      type: MaterialType.transparency,
                      elevation: 6.0,
                      color: Colors.transparent,
                      shadowColor: Colors.grey[50],
                      child: InkWell(
                        //<------------------------- InkWell
                        splashColor: Colors.white30,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FormPelanggaran()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.warning,
                                size: 40.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Catat Pelanggaran",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
