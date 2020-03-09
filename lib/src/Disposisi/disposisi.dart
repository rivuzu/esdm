import 'package:esdm/src/Disposisi/index.dart';
import 'package:esdm/src/Helper/add_jabatan.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:esdm/src/Config/config_jabatan.dart';

class TujuanDisposisi extends StatefulWidget{
  @override 
  var idJabatan;
  var idUser;
  TujuanDisposisi({this.idJabatan,this.idUser});
  State createState() => _TujuanDisposisiState();
}

class _TujuanDisposisiState extends State<TujuanDisposisi>{
  // List <String> tujuan = ["Pilih Tujuan","SUBBAG RENMIN","BAG DALPRES","BAG BINKAR","BAG WATPERS","BAG PSI"];
  // String _tujuan = "Pilih Tujuan";
  int _tujuan;
  final formKey = new GlobalKey<FormState>();
  
  
  AddJabatan addJabatan = new AddJabatan();
  List valueTujuan = [];

  // List valueTujuan = [
  //   {
  //     "display": "SUBBAG RENMIN",
  //     "value": "SUBBAG RENMIN",
  //   },
  //   {
  //     "display": "BAG DALPRES",
  //     "value": "BAG DALPRES",
  //   },
  //   {
  //     "display": "BAG BINKAR",
  //     "value": "BAG BINKAR",
  //   },
  //   {
  //     "display": "BAG WATPERS",
  //     "value": "BAG WATPERS",
  //   },
  //   {
  //     "display": "BAG PSI",
  //     "value": "BAG PSI",
  //   }
  // ];

  // void pilihTujuan(String value){
  //   setState(() {
  //    _tujuan = value; 
  //   });
  // }

  @override

  void initState(){
    super.initState();
    try {
      ConfigJabatan.getData(addJabatan);
      print("idJab" + idJabatan.toString());
    }catch (exception){

    }
  }
  
  dataJabatan() async{
     for(var item in addJabatan.ShowData()){  
        valueTujuan.add(
            {
              "display": item.nama,
              "value": item.id,
            }
        ) ; 
    }
  }
  
  simpanTujuan() async {
    Navigator.pop(context, false);
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