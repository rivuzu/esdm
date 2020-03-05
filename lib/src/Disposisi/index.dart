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

  @override 

  void initState(){
    super.initState();
    try{

    loadDataLogin();
    print("DATA" + loadDataLogin());

    }catch (exception){

    }
  }

  loadDataLogin() async{
    try{
      repoUser.findAll().then((val){
        if (val.length > 0) {
          repoUser.findOne(val.length - 1).then((data){
            setState(() => data.nama);
            setState(() => data.jabatan_id);
            setState(() => data.jabatan_parent_id);
            setState(() => data.jabatan_child_ids);
          });
        }
      });
    }catch (exception){

    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('List Disposisi'),
          backgroundColor: Colors.deepOrange,
        ),

        body: ListView.builder(
          itemCount: 5,
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
                            Text("Dari : "+name[index], style: TextStyle(color: Colors.black,fontSize: 
                            18.0, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5.0),
                            Text("Tanggal : "+date[index].toString(), style: TextStyle(color: Colors.grey[600])),
                            Text("Prihal : "+about[index], style: TextStyle(color: Colors.grey[600])),
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
                              MaterialPageRoute(builder: (context)=>TujuanDisposisi()),
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