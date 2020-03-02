import 'package:esdm/src/Home/index.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:esdm/config/storage.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pref_dessert/pref_dessert.dart';

class KenaikanPangkat extends StatefulWidget{
  @override 
  State createState() => _KenaikanPangkatState();
}

class _KenaikanPangkatState extends State<KenaikanPangkat>{

// var repo = new FuturePreferencesRepository<KenaikanPangkat>(new KenaikanDesSer());

DateTime _dateTime;


Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
          title: new Text('Kenaikan Pangkat'),
          backgroundColor: Colors.black,
        ),
    body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.only(top:20, ),
                children: <Widget>[
                SizedBox(
                  height: 150.0,
                  child: Image.asset("lib/assets/img/naik_pangkat.png", fit: BoxFit.contain),
                ),
                SizedBox(height: 10.0,),
                      new Text('Forum ini dipergunakan bagi Anggota yang ingin menyampaikan pertanyaan, keluhan atau saran masalah kenaikan pangkat.', style: TextStyle(fontSize: 15),),
                      const Divider(
                        height: 16.0,
                      ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                    ),
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Pangkat/NRP',
                    ),
                  ),
                  new TextFormField(
                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                    decoration: const InputDecoration(
                      labelText: 'No HP',
                    ),
                  ),
                  SizedBox(height: 10.0,),
                      new Text('Tanggal Laporan', style: TextStyle(fontSize: 15),),
                      const Divider(
                        height: 16.0,
                      ),
                      new Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Text(_dateTime == null? 'Nothing has been picked yet': new DateFormat(Storage.DATADATEFORMATDDMMMYYYY).format( _dateTime)),
                          ),

                       new Theme(
                        data: Theme.of(context).copyWith(
                          accentColor: Colors.black,
                          primaryColor: Colors.black
                        ),
                        child: new Builder(
                          builder: (context) => new FloatingActionButton(
                            backgroundColor: Colors.black,
                            child: new Icon(Icons.date_range),
                            onPressed: () {
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2001),
                                    lastDate: DateTime(2220),
                                ).then((date){
                                    setState(() {
                                      _dateTime = date;
                                    });
                                });
                            }
                          ),
                        ),
                      ),
                        ],
                      ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Sampaikan Keluhan Anda di Sini',
                    ),
                  ),
                ],
              ))),
              bottomNavigationBar: Container(
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 50,
                    child:  RaisedButton(
                      onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                      },
                      color: Colors.grey,
                      child: Text("Reset",style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                      },
                      color: Colors.black,
                      child: Text('Submit',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
  );
}
}

