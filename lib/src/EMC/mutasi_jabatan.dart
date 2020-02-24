import 'package:esdm/src/Home/index.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MutasiJabatan extends StatefulWidget{
  @override 
  State createState() => _MutasiJabatanState();
}

class _MutasiJabatanState extends State<MutasiJabatan>{
  Timer _timer;
int _start = 0;

DateTime _dateTime;

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
  return new Scaffold(
    appBar: new AppBar(
          title: new Text('Mutasi Jabatan'),
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
                  child: Image.asset("lib/assets/img/mutasi.png", fit: BoxFit.contain),
                ),
                SizedBox(height: 10.0,),
                      new Text('Aplikasi ini di peruntukan bagi para anggota untuk menyampaikan saran dan keluhan Permasalahan tentang Mutasi Jabatan.', style: TextStyle(fontSize: 15),),
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
                            child: Text(_dateTime == null? 'Nothing has been picked yet': ( _dateTime)),
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
                                    lastDate: DateTime.now()
                                ).then((date){
                                    setState(() {
                                      _dateTime = date;
                                    });
                                });
                            }
                          ),
                        ),
                      ),
//                          RaisedButton(
//                            padding: EdgeInsets.only(left: 0),
//                            child: Icon(Icons.date_range),
//                            onPressed: (){
//                              showDatePicker(
//                                  context: context,
//                                  initialDate: DateTime.now(),
//                                  firstDate: DateTime(2001),
//                                  lastDate: DateTime.now()
//                              ).then((date){
//                                setState(() {
//                                  _dateTime = date;
//                                });
//                              });
//                            },
//                          )
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