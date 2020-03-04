import 'dart:convert';

import 'package:esdm/src/Config/config_konsultasi.dart';
import 'package:esdm/src/Config/config_user.dart';
import 'package:esdm/src/Config/storage.dart';
import 'package:esdm/src/Helper/add_user.dart';
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
      ConfigUser.getData(addUser);
      getListChatAll();
    }catch (exception) {
    }
  }

  getListChatAll() async{
    repoUser.findAll().then((val){
      if(val.length > 0){
        repoUser.findOne(val.length - 1).then((data){
            if(data != null){
                for(var item in addUser.ShowData()){
                  if(data.role == Storage.ROLEPASIEN){
                    if(item.role == Storage.ROLEDOKTER){
                      KonsultasiMessage message = new KonsultasiMessage(
                        message : "",
                        sender : item.nama,
                        id_sender : item.id_user,
                        id_chat : data.id_user +'-'+ item.id_user,
                        role : item.role,
                      );
                      KonsultasiMessage message2 = new KonsultasiMessage(
                        message : "",
                        sender : item.nama,
                        id_sender : item.id_user,
                        id_chat : "",
                        role : item.role,
                      );
                      setState(() {
                        _listKonsultasi.insert(0, message);
                      });
                      setState(() {
                        _listKonsultasiHistory.insert(0, message2);
                      });
                    }
                  }
                }

                _client.history(data.id_user, 100).then((items) {
                  if (items != null && items.isNotEmpty) {
                    for(var data in items){
                      _konsultasi = new Konsultasi.fromJson(json.decode(data));
                      KonsultasiMessage message = new KonsultasiMessage(
                        message : _konsultasi.message.message,
                        sender : _konsultasi.message.sender,
                        id_sender : _konsultasi.message.id_sender,
                        id_chat : _konsultasi.message.id_chat,
                        role : _konsultasi.message.role,
                      );
                      setState(() {
                        _listKonsultasi.insert(0, message);
                      });
                      setState(() {
                        _listKonsultasiHistory.insert(0, message);
                      });
                    }
                  } else {
                    print('No items');
                  }
                });
            }
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Konsultasi Psikologi'),
        backgroundColor: Colors.green,
      ),
      body:
      Container(
        child:  ListView.builder(
            itemCount: _listKonsultasi.length,
//            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
                for(var item in _listKonsultasiHistory){
                  print("Jumlah data :"+_listKonsultasi[index].id_chat.contains(item.id_chat).toString());
                  print("Jumlah data2 :"+_listKonsultasi[index].id_chat.toString());
                  print("Jumlah data3 :"+item.id_chat.toString());
//                  if(item.id_chat.contains(_listKonsultasi[index].id_chat) == false){
//              if(_listKonsultasi[index].id_chat != _listKonsultasiHistory[index-1].id_chat){
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => KonselorProfile(nama :_listKonsultasi[index].sender)),
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
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Chat(id_dokter: _listKonsultasi[index].id_sender,role: _listKonsultasi[index].role)),
                                      );
                                    },
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(width: 10.0),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width:
                                              MediaQuery.of(context).size.width / 1.6,
                                              child: Text(
                                                _listKonsultasi[index].sender,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(_listKonsultasi[index].message,
                                                style: TextStyle(color: Colors.grey[600])),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    width: 20.0,
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
                            ],
                          ),
                        ),
                      ),
                    );
//                  }
                }
//              }
            }
        ),
      )

    );
  }
}
