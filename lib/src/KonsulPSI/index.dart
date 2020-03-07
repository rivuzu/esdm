import 'dart:convert';

import 'package:esdm/src/Config/config_konsultasi.dart';
import 'package:esdm/src/Config/config_user.dart';
import 'package:esdm/src/Config/storage.dart';
import 'package:esdm/src/Helper/add_user.dart';
import 'package:esdm/src/Home/index.dart';
import 'package:esdm/src/KonsulPSI/konselorprofile.dart';
import 'package:esdm/src/KonsulPSI/roomchat.dart';
import 'package:esdm/src/Model/KonsultasiMessage.dart';
import 'package:esdm/src/Model/konsultasi.dart';
import 'package:esdm/src/Model/user.dart';
import 'package:esdm/src/Model/user_desser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pubnub/pubnub.dart';
import 'package:pref_dessert/pref_dessert.dart';

class Pesan extends StatefulWidget {
  @override
  _PesanState createState() => _PesanState();
}

class _PesanState extends State<Pesan> {
//  List name = [
//    "AKBP R SAJARWO SAPUTRO, Psi",
//    "KOMPOL JAROT TRI ADIONO, M.Psi",
//    "PEMBINA KARTIKA W., S. PsI., M.M",
//    "PENATA PUJI RAHAYU, S. Psi",
//    "PENATA WORONINGROEM, S. Psi"
//  ];
  List status = ["Online", "Online", "Online", "Online", "Online"];
  var statusColor = [
    Colors.green,
    Colors.green,
    Colors.green,
    Colors.green,
    Colors.green
  ];
  String roleLogin = "";
  AddUser addUser = new AddUser();
  Konsultasi _konsultasi = new Konsultasi();
  List<KonsultasiMessage> _listKonsultasiHistory = new List();
  List<KonsultasiMessage> _listKonsultasi = new List();
  final PubNub _client = PubNub(PubNubConfig(ConfigKonsultasi.PublishKey, ConfigKonsultasi.SubscribeKey));
  var repoUser = new FuturePreferencesRepository<User>(new UserDesser());
//  List recent = ["Baik, silahkan", "", "", "", ""];

  @override
  void initState() {
    super.initState();
    try{
      print("initState");
      ConfigUser.getData(addUser);
//      deleteDuplicate(_listKonsultasi,"Masuk 1");
    }catch (exception) {
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
    getListChatAll();
  }

  getListChatAll() async{
    repoUser.findAll().then((val){
      if(val.length > 0){
        repoUser.findOne(val.length - 1).then((data) async {
            if(data != null){
              setState(() { roleLogin = data.role; });
             await _client.history(data.id_user, 100).then((items) async {
                if (items != null && items.isNotEmpty) {
                     for(var data in items){
                         await dataHistoriKonsultasi(data);
                    }
                } else {
                  print('No items');
                }
              });

              for(var item in addUser.ShowData()){
                await dataDefaultDokter(data,item);
              }
               await deleteDuplicate(_listKonsultasi,"masuk 6");

            }
        });
      }
    });
  }

  Future dataHistoriKonsultasi(var data) async{
    _konsultasi = new Konsultasi.fromJson(json.decode(data));
    KonsultasiMessage message = new KonsultasiMessage(
      message : _konsultasi.message.message,
      sender : _konsultasi.message.sender,
      id_sender : _konsultasi.message.id_sender,
      id_chat : _konsultasi.message.id_chat,
      pasien_name: _konsultasi.message.pasien_name,
      dokter_name: _konsultasi.message.dokter_name,
      role : _konsultasi.message.role,
    );
    setState(() {
      _listKonsultasi.insert(0, message);
    });
  }

  Future dataDefaultDokter(var data,var item) async{
    if(data.role == Storage.ROLEPASIEN){
      if(item.role == Storage.ROLEDOKTER){
        KonsultasiMessage message = new KonsultasiMessage(
          message : "",
          sender : item.nama,
          id_sender : item.id_user,
          id_chat : item.id_user,
          pasien_name: data.nama,
          dokter_name: item.nama,
          role : item.role,
        );
        setState(() {
          _listKonsultasi.add(message);
        });
      }
    }
  }

  Future deleteDuplicate(List<KonsultasiMessage> konsultasi,String Pesan) async{
//    print(Pesan+konsultasi.length.toString());
    for(var item in konsultasi){
      int index;
      setState(() {
        index = _listKonsultasiHistory.indexWhere((x) => x.id_chat == item.id_chat);
      });
//      print("DATA Index"+index.toString());
      if(index <= -1){
        setState(() {
          _listKonsultasiHistory.add(item);
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Konsultasi Psikologi'),
        backgroundColor: Colors.green,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator
                  .of(context)
                  .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  Home()));
            }),
      ),
      body:
      Container(
        child:  ListView.builder(
            itemCount: _listKonsultasiHistory.length,
//            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var name = "";
//              print("Role Login : "+roleLogin);
              if(roleLogin == Storage.ROLEPASIEN){
                name = _listKonsultasiHistory[index].dokter_name;
//                print("Name Dokter: "+name);
              }else{
                name = _listKonsultasiHistory[index].pasien_name;
//                print("Name Pasien: "+name);
              }
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                     new  Container(
                                          child:   InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => KonselorProfile(nama :name)),
                                              );
                                            },
                                            child: Container(
                                              width: 55.0,
                                              height: 55.0,
                                              // color: Colors.green,
                                              child: CircleAvatar(
                                                // backgroundColor: Colors.green,
                                                foregroundColor: Colors.green,
                                                // backgroundImage: NetworkImage(
                                                //     "https://img.icons8.com/doodle/48/000000/user.png"),
                                                child: Icon(Icons.person),
                                              ),
                                            ),
                                          ),
                                        ),
                                     new  Expanded(
                                        flex: 6,
                                        child: Container(
                                          child:  InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Chat(id_dokter: _listKonsultasiHistory[index].id_chat,role: _listKonsultasiHistory[index].role,name :name)),
                                              );
                                            },
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(width: 10.0),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      name,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  SizedBox(height: 5.0),
                                                  Text(_listKonsultasiHistory[index].message,
                                                          style: TextStyle(color: Colors.grey[600])),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                     new Container(
                                          width: 50.0,
                                          height: 55.0,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                height: 20.0,
                                                decoration: new BoxDecoration(
                                                  color: Colors.green,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              SizedBox(height: 5.0),
                                              Text("Online")
                                            ],
                                          ),
                                        ),
                            ],
                          ),
                        ),
                      ),
                    );
            }
        ),
      )

    );
  }
}
