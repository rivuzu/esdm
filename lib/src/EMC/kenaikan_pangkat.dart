import 'package:esdm/src/Config/config_message.dart';
import 'package:esdm/src/EMC/index.dart';
import 'package:esdm/src/Model/KenaikanDesSer.dart';
import 'package:esdm/src/Model/KenaikanPangkat.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:esdm/src/Config/storage.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:esdm/src/Home/index.dart';
import 'package:pref_dessert/pref_dessert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class KenaikanPangkat extends StatefulWidget{
  @override 
  State createState() => _KenaikanPangkatState();
}

class _KenaikanPangkatState extends State<KenaikanPangkat>{

var repo = new FuturePreferencesRepository<NaikPangkat>(new KenaikanDesSer()); 
  
  TextEditingController _namaController = TextEditingController();
  TextEditingController _nrpController = TextEditingController();
  TextEditingController _nomorController = TextEditingController();
  TextEditingController _keluhanController = TextEditingController();
  DateTime _dateTime;

@override
void initState(){
  super.initState();
  try {
    loadDataKenaikanPangkat(Storage.KENAIKANID);
  } catch (exception) {
    
  }
}

loadDataKenaikanPangkat(String kenaikanid)async{
  try {
    repo.findAll().then((naik){
      if (naik.length > 0) {
        repo.findOne(naik.length - 1).then((naikPangkat){
          if (naikPangkat != null) {
            setState(() => _namaController.text = naikPangkat.Nama);
            setState(() => _nrpController.text = naikPangkat.NRP);
            setState(() => _nomorController.text = naikPangkat.Nomor.toString());
            setState(() => _dateTime = DateTime.parse(naikPangkat.Laporan));
            setState(() => _keluhanController.text = naikPangkat.Keluhan);
          }
        });
      }
    });
  } catch (exception) {

  }
}

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
                    controller: _namaController,
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Pangkat/NRP',
                    ),
                    controller: _nrpController,
                  ),
                  new TextFormField(
                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                    decoration: const InputDecoration(
                      labelText: 'No HP',
                    ),
                    controller: _nomorController,
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
                    controller: _keluhanController,
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
                      onPressed: () { 
                        savePangkat();
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
void savePangkat(){
  repo.save(new NaikPangkat(
  _namaController.text, 
  _nrpController.text, 
  int.parse(_nomorController.text),
  _dateTime.toString(),
  _keluhanController.text)).then((naik){
    if(naik != null){
      Alert(context: context,title: ConfigMessage.DATATITLEMESSAGESUCCSESS,type: AlertType.success, desc: 'Berhasil Di ubah',
            buttons: [
              DialogButton(
                child: Text(
                    ConfigMessage.DataTextMessageButtonOK,style: TextStyle(color: Colors.white,fontSize: 20)
                ),
                onPressed: () => Navigator.pop(context),
                color: Colors.black,  
              ),
            ],).show();
    }
  });
  Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => EMC()),
         );
}
}

