import 'package:esdm/src/Config/config_message.dart';
import 'package:esdm/src/Config/config_user.dart';
import 'package:esdm/src/EMC/index.dart';
import 'package:esdm/src/Helper/add_user.dart';
import 'package:esdm/src/Model/KenaikanDesSer.dart';
import 'package:esdm/src/Model/KenaikanPangkat.dart';
import 'package:esdm/src/Model/user.dart';
import 'package:esdm/src/Model/user_desser.dart';
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

  List<NaikPangkat> _listkenaikanPangkat = new List();
  List<NaikPangkat> _listPangkat = new List();
  var user = new FuturePreferencesRepository<User>(new UserDesser()); 
  var pangkat = new FuturePreferencesRepository<NaikPangkat>(new KenaikanDesSer());
  String namaUser = "";
  String idUser = "";
  TextEditingController _namaController = TextEditingController();
  TextEditingController _nrpController = TextEditingController();
  TextEditingController _nomorController = TextEditingController();
  TextEditingController _keluhanController = TextEditingController();
  DateTime _dateTime;

  AddUser addUser = new AddUser();

@override
void initState(){
  super.initState();
//  loadDataKenaikanPangkat();
      ConfigUser.getData(addUser);
      getDataUserLogin();
}

Future<void> didChangeDependencies() async {
  super.didChangeDependencies();
//    await loadDataKenaikanPangkat();
    // await deleteDuplicate(_listPangkat);
//    await loadData();
  await saveDefauldData();
  await getDataKenaikan();
  print('didChangeDependencies');
}

  Future<void> loadData
      (
        String nama,
        String nrp,
        String nomor,
        String laporan,
        String keluhan
      ) async{
    try {
      print("MASUK LOAD DATA");
      setState(() { _namaController.text = nama;});
      setState(() { _nrpController.text = nrp;});
      setState(() { _nomorController.text = nomor;});
      setState(() { _dateTime = DateTime.parse(laporan);});
      setState(() { _keluhanController.text = keluhan;});
    } catch (e) {
    }
  }

  Future<void> getDataKenaikan() async {
   await pangkat.findAll().then((data){
     print("JUMLAH KENAIKAN : "+data.length.toString());
      for(var item in data){
        print("DATA USER 1 :"+idUser);
        print("DATA USER 2 :"+item.Id);
        if(item.Id == idUser){
          print("MASUK GET KENAIKAN :"+idUser);
          loadData
            (
              item.Nama,
              item.NRP,
              item.Nomor,
              item.Laporan,
              item.Keluhan
          );
        }
      }
    });
  }

  Future<void> saveDefauldData() async {
//    await pangkat.removeAll();
     await pangkat.findAll().then((data) async {
       print("JUMLAH DATA" + data.length.toString());
       if(data.length <= 0){
         print("SAVE DATA");
         for(var item in addUser.ShowData()){
           print("SAVE 1");
           await pangkat.save(new NaikPangkat(
             item.id_user,
             item.nama,
             item.pangkat,
             item.no_hp,
             "",
             "",
             Storage.TypeKenaikanMC2,
           ));
           print("SAVE 2");
         }
       }
      });
  }

//loadDataKenaikanPangkat()async{
//  try {
//   await user.findAll().then((naik) async {
//      if (naik.length > 0) {
//        await user.findOne(naik.length - 1).then((naikPangkat) async {
//          if (naikPangkat != null) {
//            print("DATA 2");
//            await setState(() { idUser = naikPangkat.id_user;});
//           await setState(() { namaUser = naikPangkat.nama;});
//            await loadData
//              (
//                naikPangkat.nama,
//                naikPangkat.pangkat,
//                naikPangkat.no_hp,
//                "",
//                ""
//            );
//          }
//        });
//      }
//      });
//      print("namaUser"+namaUser);
//    await pangkat.findAll().then((naik) async {
//      if (naik.length > 0) {
//        if(naik != null){
//          await pangkat.findAllWhere((x) => x.Nama == namaUser).then((data) async {
//            print("MASUK "+namaUser);
//            if(data != null){
//              await pangkat.findOne(data.length - 1).then((naikPangkat) async {
//                print("MASUK 2"+namaUser);
//                await loadData
//                  (
//                    naikPangkat.Nama,
//                    naikPangkat.NRP,
//                    naikPangkat.Nomor,
//                    naikPangkat.Laporan,
//                    naikPangkat.Keluhan
//                );
//              });
//            }else{
//              print("MASUK 3"+namaUser);
//              getDataUserLogin();
//            }
//
//            });
//        }else{
//          print("MASUK 4"+namaUser);
//          getDataUserLogin();
//        }
//        for(var pangkat in naik){
//          if(namaUser == pangkat.Nama){
//            var data = _listPangkat.indexWhere((x) => x.Nama == pangkat.Nama);
//            print("DATA : "+data.toString());
//            if(data <= -1){
////              await loadData
////                (
////                  pangkat.Nama,
////                  pangkat.NRP,
////                  pangkat.Nomor,
////                  pangkat.Laporan,
////                  pangkat.Keluhan
////              );
//              setState(() {
//                _listPangkat.add(pangkat);
//              });
//            }
//          }else{
//              print("DATA 3:");
//              getDataUserLogin();
//            }
//          }
//          }else{
//            print("Data 3");
//            getDataUserLogin();
//        }
//    });
//  } catch (exception) {
//
//  }
//}
//
getDataUserLogin() async {
    await user.findAll().then((naik) async {
          if (naik.length > 0) {
           await user.findOne(naik.length - 1).then((naikPangkat) async {
              if (naikPangkat != null) {
                print("MASUK GET USER");
                await setState(() { idUser = naikPangkat.id_user;});
                await setState(() { namaUser = naikPangkat.nama;});
//                setState(() => _namaController.text = naikPangkat.nama);
//                setState(() => _nrpController.text = naikPangkat.pangkat);
//                setState(() => _nomorController.text = naikPangkat.no_hp);
              }
            });
          }
         });
}
//
//  Future deleteDuplicate(List<NaikPangkat> kenaikan) async{
//    for(var item in kenaikan){
//      int index;
//      setState(() {
//        index = _listkenaikanPangkat.indexWhere((x) => x.Nama == item.Nama);
//      });
//      print("DATA Index"+index.toString());
//      if(index <= -1){
//        setState(() {
//          _listkenaikanPangkat.add(item);
//        });
//      }
//    }
//  }

Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
          title: new Text('Kenaikan Pangkat'),
          backgroundColor: Colors.brown,
        ),
    body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
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
                  new TextField(
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                    ),
                    controller: _namaController,
                  ),
                  new TextField(
                    decoration: const InputDecoration(
                      labelText: 'Pangkat/NRP',
                    ),
                    controller: _nrpController,
                  ),
                  new TextField(
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
                          accentColor: Colors.brown,
                          primaryColor: Colors.brown
                        ),
                        child: new Builder(
                          builder: (context) => new FloatingActionButton(
                            backgroundColor: Colors.brown,
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
                  new TextField(
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
                      onPressed: () {
                        removeAll();
                      },
                      color: Colors.grey[200],
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
                      color: Colors.brown,
                      child: Text('Submit',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
  );
}
  Future<void> save(
      String id,
      String nama,
      String nrp,
      String nomor,
      String date,
      String keluhan
    ) async {
  await pangkat.save(new NaikPangkat(
      id,
      nama,
      nrp,
      nomor,
      date,
      keluhan,
      "Kenaikan"
  )).then((naik) async {
    if(naik != null){
      await Alert(context: context,title: ConfigMessage.DATATITLEMESSAGESUCCSESS,type: AlertType.success, desc: 'Berhasil Di ubah',
        buttons: [
          DialogButton(
            child: Text(
                ConfigMessage.DataTextMessageButtonOK,style: TextStyle(color: Colors.white,fontSize: 20)
            ),
            onPressed: () => Navigator.pop(context, false),
            color: Colors.black,
          ),
        ],).show();
      Navigator
          .of(context)
          .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  EMC()));
      print(_dateTime.toString() + ',' + _keluhanController.text);
    }
  });
}

  Future<void> update(
        String id,
        String nama,
        String nrp,
        String nomor,
        String date,
        String keluhan
    ) async {
          await pangkat.updateWhere((x) => x.Id == idUser && x.Type == Storage.TypeKenaikanMC2,new NaikPangkat(
              id,
              nama,
              nrp,
              nomor,
              date,
              keluhan,
              Storage.TypeKenaikanMC2
          ));
          await Alert(context: context,title: ConfigMessage.DATATITLEMESSAGESUCCSESS,type: AlertType.success, desc: 'Berhasil Di ubah',
              buttons: [
              DialogButton(
              child: Text(
              ConfigMessage.DataTextMessageButtonOK,style: TextStyle(color: Colors.white,fontSize: 20)
          ),
          onPressed: () => Navigator.pop(context, false),
          color: Colors.black,
          ),
          ],).show();
          Navigator
              .of(context)
              .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  EMC()));
}

  Future<void> removeAll() async {
    await update(
      idUser,
      _namaController.text,
      _nrpController.text,
      _nomorController.text,
      "",
      "",
    );
//    await pangkat.updateWhere((x) => x.Id == idUser && x.Type == "Kenaikan",new NaikPangkat(
//        idUser,
//        _namaController.text,
//        _nrpController.text,
//        _nomorController.text,
//        "",
//        "",
//        "Kenaikan"
//    ));
//    await Alert(context: context,title: ConfigMessage.DATATITLEMESSAGESUCCSESS,type: AlertType.success, desc: 'Berhasil Di ubah',
//      buttons: [
//        DialogButton(
//          child: Text(
//              ConfigMessage.DataTextMessageButtonOK,style: TextStyle(color: Colors.white,fontSize: 20)
//          ),
//          onPressed: () => Navigator.pop(context, false),
//          color: Colors.black,
//        ),
//      ],).show();
//    Navigator
//        .of(context)
//        .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  EMC()));
  }
Future<void> savePangkat() async {
//  await pangkat.findAll().then((val) async {
//      if(val.length < 0){
//        await save(
//          idUser,
//          _namaController.text,
//          _nrpController.text,
//          _nomorController.text,
//          _dateTime.toString(),
//          _keluhanController.text,
//        );
//      }else{
       await update(
          idUser,
          _namaController.text,
          _nrpController.text,
          _nomorController.text,
          _dateTime.toString(),
          _keluhanController.text,
        );
//      }
//  });
//      await pangkat.save(new NaikPangkat(
//          idUser,
//          _namaController.text,
//          _nrpController.text,
//          _nomorController.text,
//          _dateTime.toString(),
//          _keluhanController.text,
//          "Kenaikan"
//      )).then((naik) async {
//        if(naik != null){
//          await Alert(context: context,title: ConfigMessage.DATATITLEMESSAGESUCCSESS,type: AlertType.success, desc: 'Berhasil Di ubah',
//            buttons: [
//              DialogButton(
//                child: Text(
//                    ConfigMessage.DataTextMessageButtonOK,style: TextStyle(color: Colors.white,fontSize: 20)
//                ),
//                onPressed: () => Navigator.pop(context, false),
//                color: Colors.black,
//              ),
//            ],).show();
//          Navigator
//              .of(context)
//              .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  EMC()));
//          print(_dateTime.toString() + ',' + _keluhanController.text);
//        }
//      });
    }
}

