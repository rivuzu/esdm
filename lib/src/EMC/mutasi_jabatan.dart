import 'package:esdm/src/Config/config_message.dart';
import 'package:esdm/src/Config/config_user.dart';
import 'package:esdm/src/EMC/index.dart';
import 'package:esdm/src/Helper/add_user.dart';
import 'package:esdm/src/Home/index.dart';
import 'package:esdm/src/Model/KenaikanPangkat.dart';
import 'package:esdm/src/Model/MutasiDesSer.dart';
import 'package:esdm/src/Model/user.dart';
import 'package:esdm/src/Model/user_desser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:esdm/src/Config/storage.dart';
import 'package:pref_dessert/pref_dessert_internal.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MutasiJabatan extends StatefulWidget{
  @override 
  State createState() => _MutasiJabatanState();
}

class _MutasiJabatanState extends State<MutasiJabatan> {

  List<NaikPangkat> _listmutasijabatan = new List();
  List<NaikPangkat> _listmutasi = new List();
  var mutasi = new FuturePreferencesRepository<NaikPangkat>(new MutasiDesSer());
  var user = new FuturePreferencesRepository<User>(new UserDesser());

  String namaUser = "";
  String idUser = "";
  TextEditingController _namaController = TextEditingController();
  TextEditingController _nrpController = TextEditingController();
  TextEditingController _nomorController = TextEditingController();
  TextEditingController _keluhanController = TextEditingController();
  DateTime _dateTime;
  AddUser addUser = new AddUser();

  @override
  void initState() {
    super.initState();
    try {
      ConfigUser.getData(addUser);
      getDataUserLogin();
//      loadDataMutasiJabatan();
    } catch (exception) {

    }
  }

  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
//    await loadDataMutasiJabatan();
    // await deleteDuplicate(_listPangkat);
//    await loadData();
    await saveDefauldData();
    await getDataKenaikan();
    print('didChangeDependencies');
  }

  loadData
      (
      String nama,
      String nrp,
      String nomor,
      String laporan,
      String keluhan
      ) async{
    try {
      setState(() { _namaController.text = nama;});
      setState(() { _nrpController.text = nrp;});
      setState(() { _nomorController.text = nomor;});
      setState(() { _dateTime = DateTime.parse(laporan);});
      setState(() { _keluhanController.text = keluhan;});
    } catch (e) {
    }
  }

  Future<void> saveDefauldData() async {
//    await pangkat.removeAll();
    await mutasi.findAll().then((data) async {
      print("JUMLAH DATA" + data.length.toString());
      if(data.length <= 0){
        print("SAVE DATA");
        for(var item in addUser.ShowData()){
          print("SAVE 1");
          await mutasi.save(new NaikPangkat(
            item.id_user,
            item.nama,
            item.pangkat,
            item.no_hp,
            "",
            "",
            Storage.TypeMutasiMC2,
          ));
          print("SAVE 2");
        }
      }
    });
  }

//  loadDataMutasiJabatan() async {
//    try {
//      await user.findAll().then((mutasi) async {
//        if (mutasi.length > 0) {
//          await user.findOne(mutasi.length - 1).then((mutasiJabatan) async {
//            if (mutasiJabatan != null) {
//              print("DATA 2");
//              await setState(() {
//                idUser = mutasiJabatan.id_user;
//              });
//              await setState(() {
//                namaUser = mutasiJabatan.nama;
//              });
//              await loadData
//                (
//                  mutasiJabatan.nama,
//                  mutasiJabatan.pangkat,
//                  mutasiJabatan.no_hp,
//                  "",
//                  ""
//              );
//            }
//          });
//        }
//      });
//      print("namaUser" + namaUser);
//      await mutasi.findAll().then((naik) async {
//        if (naik.length > 0) {
//          if(naik != null){
//            await mutasi.findAllWhere((x) => x.Nama == namaUser).then((data) async {
//              print("MASUK "+namaUser);
//              if(data != null){
//                await mutasi.findOne(data.length - 1).then((naikPangkat) async {
//                  print("MASUK 2"+namaUser);
//                  await loadData
//                    (
//                      naikPangkat.Nama,
//                      naikPangkat.NRP,
//                      naikPangkat.Nomor,
//                      naikPangkat.Laporan,
//                      naikPangkat.Keluhan
//                  );
//                });
//              }else{
//                print("MASUK 3"+namaUser);
//                getDataUserLogin();
//              }
//            });
////            await mutasi.findOne(naik.length - 1).then((naikPangkat) async {
////              await loadData
////                (
////                  naikPangkat.Nama,
////                  naikPangkat.NRP,
////                  naikPangkat.Nomor,
////                  naikPangkat.Laporan,
////                  naikPangkat.Keluhan
////              );
////            });
//          }else{
//            print("MASUK 4"+namaUser);
//            getDataUserLogin();
//          }
//          for (var mutasi in naik) {
//            if (namaUser == mutasi.Nama) {
//              var data = _listmutasi.indexWhere((x) => x.Nama == mutasi.Nama);
//              print("DATA : " + data.toString());
//              if (data <= -1) {
////                await loadData
////                  (
////                    mutasi.Nama,
////                    mutasi.NRP,
////                    mutasi.Nomor,
////                    mutasi.Laporan,
////                    mutasi.Keluhan
////                );
//                setState(() {
//                  _listmutasi.add(mutasi);
//                });
//              }
//            } else {
//              print("DATA 3:");
//              getDataUserLogin();
//            }
//          }
//        } else {
//          print("Data 3");
//          getDataUserLogin();
//        }
//      });
//    } catch (exception) {
//
//    }
//  }

  Future<void> getDataKenaikan() async {
    await mutasi.findAll().then((data){
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


  getDataUserLogin() async {
    await user.findAll().then((mutasi) async {
      if (mutasi.length > 0) {
        await user.findOne(mutasi.length - 1).then((mutasiJabatan) async {
          if (mutasiJabatan != null) {
            await setState(() { idUser = mutasiJabatan.id_user;});
            await setState(() { namaUser = mutasiJabatan.nama;});
//            await loadData
//            (
//                mutasiJabatan.nama,
//                mutasiJabatan.pangkat,
//                mutasiJabatan.no_hp,
//                "",
//                ""
//            );
//            setState(() => _namaController.text = mutasiJabatan.nama);
//            setState(() => _nrpController.text = mutasiJabatan.pangkat);
//            setState(() => _nomorController.text = mutasiJabatan.no_hp);
          }
        });
      }
    });
  }

// loadDataMutasiJabatan()async{
//   try {
//     user.findAll().then((naik){
//       if (naik.length > 0) {
//         user.findOne(naik.length - 1).then((naikPangkat){
//           if (naikPangkat != null) {
//             setState(() => _namaController.text = naikPangkat.nama);
//             setState(() => _nrpController.text = naikPangkat.pangkat);
//             setState(() => _nomorController.text = naikPangkat.no_hp);
//           }
//         });
//       }
//     });
//   } catch (exception) {

//   }
// }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Mutasi Jabatan'),
        backgroundColor: Colors.brown,
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 25.0),
                children: <Widget>[
                  SizedBox(
                    height: 150.0,
                    child: Image.asset(
                        "lib/assets/img/mutasi.png", fit: BoxFit.contain),
                  ),
                  SizedBox(height: 10.0,),
                  new Text(
                    'Aplikasi ini di peruntukan bagi para anggota untuk menyampaikan saran dan keluhan Permasalahan tentang Mutasi Jabatan.',
                    style: TextStyle(fontSize: 15),),
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
                        child: Text(_dateTime == null
                            ? 'Nothing has been picked yet'
                            : new DateFormat(Storage.DATADATEFORMATDDMMMYYYY)
                            .format(_dateTime)),
                      ),

                      new Theme(
                        data: Theme.of(context).copyWith(
                            accentColor: Colors.brown,
                            primaryColor: Colors.brown
                        ),
                        child: new Builder(
                          builder: (context) =>
                          new FloatingActionButton(
                              backgroundColor: Colors.brown,
                              child: new Icon(Icons.date_range),
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2001),
                                  lastDate: DateTime(2220),
                                ).then((date) {
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
                child: RaisedButton(
                  onPressed: () {
                    removeAll();
                  },
                  color: Colors.grey[200],
                  child: Text("Reset", style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    saveMutasi();
                  },
                  color: Colors.brown,
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//void removeAll(){
//  mutasi.removeAll();
//}
  Future<void> removeAll() async {
   await update(
      idUser,
      _namaController.text,
      _nrpController.text,
      _nomorController.text,
      "",
      "",
    );
//    await mutasi.updateWhere((x) => x.Id == idUser && x.Type == "Mutasi",new NaikPangkat(
//        idUser,
//        _namaController.text,
//        _nrpController.text,
//        _nomorController.text,
//        "",
//        "",
//        "Mutasi"
//    ));
//    await  Alert(context: context,title: ConfigMessage.DATATITLEMESSAGESUCCSESS,type: AlertType.success, desc: 'Berhasil Di ubah',
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

  Future<void> save(
        String id,
        String nama,
        String nrp,
        String nomor,
        String date,
        String keluhan
      ) async {
      await mutasi.save(new NaikPangkat(
          id,
          nama,
          nrp,
          nomor,
          date,
          keluhan,
          "Mutasi"
      )).then((mutasi) async {
        if (mutasi != null) {
          await Alert(
            context: context,
            title: ConfigMessage.DATATITLEMESSAGESUCCSESS,
            type: AlertType.success,
            desc: 'Berhasil Di ubah',
            buttons: [
              DialogButton(
                child: Text(
                    ConfigMessage.DataTextMessageButtonOK,
                    style: TextStyle(color: Colors.white, fontSize: 20)
                ),
                onPressed: () => Navigator.pop(context, false),
                color: Colors.black,
              ),
            ],).show();
          Navigator
              .of(context)
              .pushReplacement(
              new MaterialPageRoute(builder: (BuildContext context) => EMC()));
        }
      });
  }

  Future<void> update(String id,
      String nama,
      String nrp,
      String nomor,
      String date,
      String keluhan) async {
          await mutasi.updateWhere((x) => x.Id == idUser && x.Type == Storage.TypeMutasiMC2,
              new NaikPangkat(
                  id,
                  nama,
                  nrp,
                  nomor,
                  date,
                  keluhan,
                  Storage.TypeMutasiMC2
              ));
          await Alert(context: context,
            title: ConfigMessage.DATATITLEMESSAGESUCCSESS,
            type: AlertType.success,
            desc: 'Berhasil Di ubah',
            buttons: [
              DialogButton(
                child: Text(
                    ConfigMessage.DataTextMessageButtonOK,
                    style: TextStyle(color: Colors.white, fontSize: 20)
                ),
                onPressed: () => Navigator.pop(context, false),
                color: Colors.black,
              ),
            ],).show();
          Navigator
              .of(context)
              .pushReplacement(
              new MaterialPageRoute(builder: (BuildContext context) => EMC()));
  }

  Future<void> saveMutasi() async {
//    await  mutasi.findAll().then((val) async {
//      if (val.length < 0) {
//        await save(
//            idUser,
//            _namaController.text,
//            _nrpController.text,
//            _nomorController.text,
//            _dateTime.toString(),
//            _keluhanController.text
//        );
//      } else {
      await update(
            idUser,
            _namaController.text,
            _nrpController.text,
            _nomorController.text,
            _dateTime.toString(),
            _keluhanController.text
        );
//      }
//    });
//    await mutasi.save(new NaikPangkat(
//        idUser,
//        _namaController.text,
//        _nrpController.text,
//        _nomorController.text,
//        _dateTime.toString(),
//        _keluhanController.text,
//        "Mutasi"
//    )).then((mutasi) async {
//      if (mutasi != null) {
//        await Alert(context: context,
//          title: ConfigMessage.DATATITLEMESSAGESUCCSESS,
//          type: AlertType.success,
//          desc: 'Berhasil Di ubah',
//          buttons: [
//            DialogButton(
//              child: Text(
//                  ConfigMessage.DataTextMessageButtonOK,
//                  style: TextStyle(color: Colors.white, fontSize: 20)
//              ),
//              onPressed: () => Navigator.pop(context, false),
//              color: Colors.black,
//            ),
//          ],).show();
//        Navigator
//            .of(context)
//            .pushReplacement(
//            new MaterialPageRoute(builder: (BuildContext context) => EMC()));
//        print(_dateTime.toString() + ',' + _keluhanController.text);
//      }
//    });
  }
}