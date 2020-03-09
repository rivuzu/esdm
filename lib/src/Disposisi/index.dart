import 'dart:wasm';

import 'package:esdm/src/Disposisi/detail.dart';
import 'package:esdm/src/Disposisi/disposisi.dart';
import 'package:esdm/src/Helper/show_indexdisposisi.dart';
import 'package:flutter/material.dart';
import 'package:pref_dessert/pref_dessert.dart';
import 'detail.dart';
import 'disposisi.dart';
import 'package:esdm/src/Model/indexDisposisi_desser.dart';
import 'package:esdm/src/Model/indexDisposisi.dart';
import 'package:esdm/src/Config/config_indexdisposisi.dart';
import 'dart:convert';
import 'package:esdm/src/Model/user_desser.dart';
import 'package:esdm/src/Model/user.dart';
import 'package:esdm/src/Config/storage.dart';
import 'package:esdm/src/Service/service.dart';

var idJabatan = 0 ;
var namaLogin = "";
var idUser = "";

class Disposisi extends StatefulWidget{
  @override 
  State createState() => _DisposisiState();
}

class _DisposisiState extends State<Disposisi>{
  // List<String> tujuan = ["SUBBAG RENMIN","BAG DALPRES","BAG BINKAR","BAG WATPERS","BAG PSI"];
  // String _tujuan = "SUBBAG RENMIN";

  List name = ["Khailla","Deno","Ipul","Gusti","Juan"];
  List date = ["25-02-2020","25-02-2020","25-02-2020","25-02-2020","25-02-2020"];
  List about = ["Pengaduan","Pemberitahuan","Saran","Kritik","Motivasi"];
  List<IndexDisposisi> dataJson = new List();
  ShowIndexDisposisi showIndexDisposisi = new ShowIndexDisposisi();

  // void pilihTujuan(String value){
  //   setState(() {
  //    _tujuan = value;
  //   });
  // }
  var repoUser = new FuturePreferencesRepository<User>(new UserDesser());
  var repoIndexDisposisi = new FuturePreferencesRepository<IndexDisposisi>(new IndexDisposisiDesser());
  
  // Map dataDisposisi ;
  // List disposisi;

  @override 

  void initState(){
    super.initState();
    try{

    loadDataLogin();
    // print("DATA" + loadDataLogin());
    // getDataList("1");

    }catch (exception){

    }
  }

  loadDataLogin() async{
    try{
      await repoUser.findAll().then((val){
        if (val.length > 0) {
          repoUser.findOne(val.length - 1).then((data) async {
            await setState(() { namaLogin  = data.nama; });
            await setState(() { idJabatan  = data.jabatan_id; });
            await setState(() { idUser  = data.id_user; });
            // print(id_user);
          });
        }
      });
    }catch (exception){

    }
  }

  Future<void>  _loadListView() async {
    repoIndexDisposisi.removeAll();

    ConfigIndexDisposisi.getData(showIndexDisposisi);
      for (var data in showIndexDisposisi.ShowData()) {
      await repoIndexDisposisi.save(IndexDisposisi(
        data.nama,
        data.tanggal,
        data.keperluan,
        data.id_jabatan,
        data.id_user
      )).then((data){

      });
    }

    await repoIndexDisposisi.findAll().then((val) async {
      dataJson = new List();
      for (var item in val) {
        print("heio");
        print("iduser" + idUser);
        print("item" + item.id_user.toString());
        if (item.id_user == idUser) {
          print("hei");
          await setState(() {
           dataJson.add(item); 
          });
        }
      }
    });
  }

  // getDataList(String id_jabatan) {
  //    var url = Storage.LocalBaseUrl + Storage.UrlListDisposisi;
  //    print(url);
  //   Service.Get(url).then((response){
  //     print(response.statusCode);
  //     if(response.statusCode == 200){
  //       print("test3");
  //       dataDisposisi = json.decode(response.body);
  //       setState(() {
  //         disposisi = dataDisposisi["data"];
  //         print("woi" + disposisi.toString());
  //       });
  //     }
  //   });
  // }

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await _loadListView();
    print("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('List Disposisi'),
          backgroundColor: Colors.deepOrange,
        ),

        body: ListView.builder(
          itemCount: dataJson.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Container(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 55.0,
                          height: 55.0,
                          // color: Colors.green,
                          child: CircleAvatar(
                            // backgroundColor: Colors.green,
                            foregroundColor: Colors.green,
                            backgroundImage: NetworkImage("https://img.icons8.com/doodle/48/000000/user.png"),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 185.0,
                              child: Text("Dari : "+dataJson[index].nama, textAlign: TextAlign.left, style: TextStyle(color: Colors.black,fontSize: 
                              18.0, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 5.0),
                            Text("Tanggal : "+dataJson[index].tanggal.toString(), style: TextStyle(color: Colors.grey[600])),
                            Text("Prihal : "+dataJson[index].keperluan, style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                      ],
                    ),

                    Container(
                      child: Column(
                        children: <Widget>[
                          FlatButton(
                            onPressed: (){
                              Navigator.push(context, 
                              MaterialPageRoute(builder: (context)=>Detail()),
                              );
                            },
                            color: Colors.yellow[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text("Detail", style: TextStyle(color: Colors.white)),
                          ),
                          FlatButton(
                            onPressed: (){
                              Navigator.push(context, 
                              MaterialPageRoute(builder: (context)=>TujuanDisposisi(idJabatan: idJabatan)),
                              );
                            },
                            color: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text("Disposisi", style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),

                    // Container(
                    //   alignment: Alignment.center,
                    //   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    //   child: FlatButton(
                    //     onPressed: (){},
                    //     color: Colors.deepOrange,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20.0),
                    //     ),
                    //     child: Text("Disposisi", style: TextStyle(color: Colors.white)),
                    //   ),
                    // ),

                  ],
                ),
              ),
            ),
          ),
        ),
        

        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   backgroundColor: Colors.deepOrange,
        //   onPressed: (){

        //   },
        // ),

    );
  }

}