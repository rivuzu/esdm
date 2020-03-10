import 'dart:wasm';

import 'package:esdm/src/Disposisi/detail.dart';
import 'package:esdm/src/Disposisi/disposisi.dart';
import 'package:esdm/src/Helper/show_indexdisposisi.dart';
import 'package:esdm/src/Home/index.dart';
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

int idJabatan = 0 ;
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
//  List<IndexDisposisi> dataJson2 = new List();
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

    // print("DATA" + loadDataLogin());
    // getDataList("1");

    }catch (exception){

    }
  }

  Future<void>  loadDataLogin() async{
    try{
      await repoUser.findAll().then((val) async {
        if (val.length > 0) {
          await repoUser.findOne(val.length - 1).then((data) async {
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
    await repoIndexDisposisi.findAll().then((val) async {
//      print("LENGHT "+val.length.toString());
      if(val.length <= 0){
//        print("MASUK 3");
        await _loadListViewFirst();
//        print("MASUK 4");
      }else{
        await repoIndexDisposisi.findAll().then((val) async {

//          print("MASUK 1 ");
          await setState(() {
            dataJson = new List();
          });
         await val.asMap().forEach((index,item) async {
//            print('index=$index, value=$item');
            print("item 1" + item.status.toString());
            print("item 2 " + item.nama);
            if (item.id_user == idUser && item.status != true) {
              await setState(() {
                dataJson.add(item);
              });
//              print('index=$index, value=$item');
            }
//            if(item.from_jabatan != null){
//              await setState(() {
//                dataJson2.add(item);
//              });
//            }
          });
        });
      }

    });
  }

  Future<void> removeData(List<IndexDisposisi> dataJson,List<IndexDisposisi> dataJson2) async{
    for(var item in dataJson){
//      int index;
//      setState(() {
//        index = dataJson2.indexWhere((x) =>x.nama == item.nama);
//      });
//      print("DATA Index"+index.toString());
//      if(index <= -1){
//        setState(() {
//          dataJson2.add(item);
//        });
//      }
        for(var item2 in dataJson2){
//          print("ITEM 1"+ item2.from_jabatan.toString());
          print("ITEM 2"+ item.id_jabatan.toString());


          print("ITEM 1"+ item2.nama);
          print("ITEM 2"+ item.nama);
          if(item.id_user == idUser){
//            await dataJson.removeWhere((x) =>   item2.from_jabatan != x.id_jabatan && item2.nama == x.nama);
          }

        }

      print("MASUK 2");
    }
  }

  Future<void>  _loadListViewFirst() async {
    repoIndexDisposisi.removeAll();

    ConfigIndexDisposisi.getData(showIndexDisposisi);
      for (var data in showIndexDisposisi.ShowData()) {
      await repoIndexDisposisi.save(IndexDisposisi(
        data.nama,
        data.tanggal,
        data.keperluan,
        data.id_jabatan,
        data.id_user,
        null
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

    await loadDataLogin();
    await _loadListView();
//    await removeData(dataJson,dataJson2);
    print("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    if(dataJson.length <= 0){
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('List Disposisi'),
          backgroundColor: Colors.deepOrange,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator
                    .of(context)
                    .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  Home()));
              }),
        ),

        body:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("Tidak terdapat data disposisi",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),

          ],
        )


        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   backgroundColor: Colors.deepOrange,
        //   onPressed: (){

        //   },
        // ),

      );
    }
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('List Disposisi'),
          backgroundColor: Colors.deepOrange,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator
                    .of(context)
                    .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  Home()));
              }),
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
                    new  Flexible(
                      flex: 8,
                      child:
                      Wrap(
                          direction: Axis.vertical,
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
                                Wrap(
                                  direction: Axis.vertical,
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 180.0,
                                      child:
                                          Text("Dari : "+dataJson[index].nama, textAlign: TextAlign.left, style: TextStyle(color: Colors.black,fontSize:
                                          18.0, fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 10,),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text("Tanggal : "+dataJson[index].tanggal.toString(), style: TextStyle(color: Colors.grey[600])),
                                    Text("Prihal : "+dataJson[index].keperluan, style: TextStyle(color: Colors.grey[600])),
                                  ],
                                ),
                              ],
                            ),
                          ],
                      ),
                    ),


                    Container(
                      width: 90,
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
                              MaterialPageRoute(builder: (context)=>TujuanDisposisi(
                                idJabatan: dataJson[index].id_jabatan,
                                idUser: dataJson[index].id_user,
                                nama: dataJson[index].nama,
                                perihal: dataJson[index].keperluan,
                                tanggal: dataJson[index].tanggal ,

                              )),
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