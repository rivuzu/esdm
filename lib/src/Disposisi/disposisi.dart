import 'package:esdm/src/Config/config_message.dart';
import 'package:esdm/src/Config/config_user.dart';
import 'package:esdm/src/Config/storage.dart';
import 'package:esdm/src/Disposisi/index.dart';
import 'package:esdm/src/Helper/add_jabatan.dart';
import 'package:esdm/src/Helper/add_user.dart';
import 'package:esdm/src/Model/indexDisposisi.dart';
import 'package:esdm/src/Model/indexDisposisi_desser.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:esdm/src/Config/config_jabatan.dart';
import 'package:intl/intl.dart';
import 'package:pref_dessert/pref_dessert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TujuanDisposisi extends StatefulWidget{
  @override 
  int idJabatan;
  String idUser;
  String nama;
  String tanggal;
  String perihal;
  TujuanDisposisi({this.idJabatan,this.idUser,this.nama,this.perihal,this.tanggal});
  State createState() => _TujuanDisposisiState();
}

class _TujuanDisposisiState extends State<TujuanDisposisi>{
  // List <String> tujuan = ["Pilih Tujuan","SUBBAG RENMIN","BAG DALPRES","BAG BINKAR","BAG WATPERS","BAG PSI"];
  // String _tujuan = "Pilih Tujuan";
  int _tujuan;
  final formKey = new GlobalKey<FormState>();

  var repoIndexDisposisi = new FuturePreferencesRepository<IndexDisposisi>(new IndexDisposisiDesser());
  AddUser addUser = new AddUser();
  AddJabatan addJabatan = new AddJabatan();
  List valueTujuan = [];

  @override
  void initState(){
    super.initState();
    try {
      ConfigUser.getData(addUser);
      ConfigJabatan.getData(addJabatan);
      print("idJab :" + idJabatan.toString());
    }catch (exception){

    }
  }

//  deletedDisposisi(){
//    repoIndexDisposisi.remove(widget.index);
//  }

  Future<void> saveDisposisi(int jabatan) async {
    await repoIndexDisposisi.updateWhere((x) => x.id_user == idUser && x.nama == widget.nama,IndexDisposisi(
        widget.nama,
        widget.tanggal,
        widget.perihal,
        idJabatan,
        idUser,
        true
    ));
    for(var item in addUser.ShowData()){
      if(item.jabatan_id == jabatan){
       await repoIndexDisposisi.save(IndexDisposisi(
            widget.nama,
            new DateFormat(Storage.DATADATEFORMATDDMMYYYY).format(DateTime.now()),
            widget.perihal,
            jabatan,
            item.id_user,
            false
        ));
      }

    }
  }
  
  dataJabatan() async{
     for(var item in addJabatan.ShowData()){
       if(item.parent_id == idJabatan){
         valueTujuan.add(
             {
               "display": item.nama,
               "value": item.id,
             }
         ) ;
       }
    }
  }
  
  simpanTujuan() async {
//   await deletedDisposisi();
//    await repoIndexDisposisi.remove(widget.index).then((data) async {
//      print("DATA DELETED "+data.length.toString());
      await saveDisposisi(_tujuan).then((val) async {
        await Alert(context: context,title: ConfigMessage.DataTitleMessageInfo,type: AlertType.success, desc: ConfigMessage.DataTextMessageSuccessSendDisposisi,
          buttons: [
            DialogButton(
              child: Text(
                  ConfigMessage.DataTextMessageButtonOK,style: TextStyle(color: Colors.white,fontSize: 20)
              ),
              onPressed: () => Navigator.pop(context, false),
              color: Colors.black,
            ),
          ],).show();
      });
      Navigator
          .of(context)
          .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  Disposisi()));
//    });
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await dataJabatan();
    print("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Tujuan Disposisi'),
          backgroundColor: Colors.deepOrange,
        ),
        
      // body: new Container(
      //   padding: new EdgeInsets.all(10.0),
      //   child: new Column(
      //     children: <Widget>[
      //       new DropdownButton(
      //         isExpanded: true,
      //         value: _tujuan,
      //         onChanged: (String value){
      //           pilihTujuan(value);
      //         },
      //         items: tujuan.map((String value){
      //           return new DropdownMenuItem(
      //             value: value,
      //             child: new Text(value),
      //           );
      //         }).toList(),
      //       ),

      //       RaisedButton(
      //         onPressed: () {},
      //         color: Colors.deepOrange,
      //         child: const Text(
      //           'Forward',
      //           style: TextStyle(fontSize: 20,color: Colors.white)
      //         ),
      //       ),
            
      //     ],
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Padding(
              //   padding:
              //       const EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
              //   child: FittedBox(
              //     child: Image.asset('lib/assets/img/catpers.png'),
              //     fit: BoxFit.fitWidth,
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Text("Form dimana untuk mengadukan personil beserta pelanggarannya.", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Padding(
                      //   padding: const EdgeInsets.only(left:16.0, right: 16.0, top: 16.0, bottom: 5.0),
                      //   child: Text("Pengaduan Atas Nama : " + "Deno Fambar", style: TextStyle(fontSize: 15.0),),
                      // ),
                      Form(
                        key: formKey,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(16),
                              child: DropDownFormField(
                                titleText: 'Tujuan ke',
                                hintText: 'Please choose one',
                                value: _tujuan,
                                onSaved: (value) {
                                  setState(() {
                                    _tujuan = value;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _tujuan = value;
                                  });
                                },
                                dataSource: valueTujuan,
                                textField: 'display',
                                valueField: 'value',
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: RaisedButton(
                                color: Colors.deepOrange,
                                child: Text('Simpan', style: TextStyle(color: Colors.white)),
                                onPressed: simpanTujuan,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }

}