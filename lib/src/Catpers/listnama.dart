import 'package:esdm/src/Config/config_user.dart';
import 'package:esdm/src/Helper/add_user.dart';
import 'package:esdm/src/Model/catpers_desser.dart';
import 'package:esdm/src/Model/catpers_form.dart';
import 'package:esdm/src/Model/catpers_form_desser.dart';
import 'package:esdm/src/Model/user.dart';
import 'package:esdm/src/Model/user_desser.dart';
import 'package:flutter/material.dart';
import 'package:pref_dessert/pref_dessert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:esdm/src/Model/catpers_desser.dart';
import 'package:esdm/src/Model/catpers.dart';
import 'package:esdm/src/Config/config_catpers.dart';
import 'package:esdm/src/Helper/show_catpers.dart';

class ListNama extends StatefulWidget {
  @override
  _ListNamaState createState() => _ListNamaState();
}

class _ListNamaState extends State<ListNama> {
  var items = [
    "Adi Mansyur",
    "Adi Muhammad",
    "Adi Setiawan",
    "Adi Teguh",
    "Aditya Radit",
    "Adib Pratama",
    "Adit Reza"
  ];
  var colors = [
    Colors.red,
    Colors.green,
    Colors.red,
    Colors.green,
    Colors.green
  ];
  TextEditingController _cariController = new TextEditingController();
  AddUser addUser = new AddUser();
  List<User> _listUser = new List();
  List<Catpers> _listResultUser = new List();
  List<Catpers> _listCatpers = new List();
  var repoUser = new FuturePreferencesRepository<User>(new UserDesser());
  var repoCatpers = new FuturePreferencesRepository<CatpersForm>(new CatpersFormDesser());
  // final List<String> litems = myStringList;
//  ShowCatpers showCatpers = new ShowCatpers();
//  List<Catpers> dataJson = new List();
//  var repoCatpers = new FuturePreferencesRepository<Catpers>(new CatpersDesser());

//  _loadListView() async {
//    repoCatpers.removeAll();
//
//    ConfigCatpers.getData(showCatpers);
//    for (var data in showCatpers.ShowData()) {
//      await _save(data);
//    }
//
//    repoCatpers.findAll().then((val) async {
//      for (var item in val) {
//        await _get(item);
//      }
//    });
//  }
//
//  Future _save(data) async {
//    repoCatpers
//        .save(Catpers(
//          data.nama,
//          data.warna,
//        ))
//        .then((data) {});
//    print("data");
//    print(data);
//  }
//
//  Future _get(item) async {
//    setState(() {
//      dataJson.add(item);
//    });
//    print("item");
//    print(item);
//  }

  Future<void> getDataUser() async{
    for(var item in addUser.ShowData()){
      await  setState(() {
        _listUser.add(item);
      });
    }
  }

  Future<void> getDataCatpers() async{
    await repoCatpers.findAll().then((val) async {
      if(val.length > 0){
        for(var item in val){
          for(var item2 in addUser.ShowData()){
            if(item.id_user == item2.id_user){
              await  setState(() {
                _listCatpers.add(Catpers(item2.nama,Colors.red));
              });
            }
          }
        }
      }
    });
  }

  cariData(String nama) async {
    for(var item in addUser.ShowData()){
      print("NAMA 1: "+ nama);
      print("NAMA 2: "+ item.nama);
//      if(nama.isNotEmpty){
        if(item.nama.toLowerCase().contains(nama.toLowerCase())){
          print(nama);
          await  setState(() {
            _listCatpers.add(Catpers(item.nama, Colors.green));
          });
          print(item.nama);
        }
        await deleteDuplicate(_listCatpers);
//      }
    }
  }

  Future deleteDuplicate(List<Catpers> listCatpers) async{
//    print(Pesan+konsultasi.length.toString());
    for(var item in listCatpers){
      int index;
      setState(() {
        index = _listResultUser.indexWhere((x) => x.nama == item.nama);
      });
//      print("DATA Index"+index.toString());
      if(index <= -1){
        setState(() {
          _listResultUser.add(item);
        });
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    // _loadListView();
    ConfigUser.getData(addUser);
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await getDataUser();
    await getDataCatpers();
    print("didChangeDependencies");
    super.didChangeDependencies();
//    await _loadListView();
  }

  @override
  Widget build(BuildContext context) {
    print("ASELOLE");
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('List Nama'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[

          Expanded(
            flex: 8,
            child: Container(
              child:
              Padding(
                padding: EdgeInsets.all(8.0),
                child:
                TextField(
                  controller: _cariController,
                  decoration: InputDecoration(
                    hintText: "Cari Nama",
                    //add icon outside input field
                    icon: Icon(Icons.person),
                    //add icon to the beginning of text field
                    //prefixIcon: Icon(Icons.person),
                    //can also add icon to the end of the textfiled
                    //suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 50,
              height: 50,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    cariData(_cariController.text.trim());
                  },
                  color: Colors.grey,
                  child: Icon(Icons.search),
                ),
              ),
            ),
          ),


            ],
          ),

          Expanded(
            flex: 10,
            child: ListView.separated(
              itemBuilder: (context, index) {
                Color color = Colors.green;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new  Expanded(
                        flex: 8,
                        child: Text(
                          _listResultUser[index].nama,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      new Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: new BoxDecoration(
                          color: _listResultUser[index].warna,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey,
                );
              },
              itemCount: _listResultUser.length,
            ),
          ),
        ],
      ),
    );
  }
}
