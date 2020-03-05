import 'package:esdm/src/Model/catpers_desser.dart';
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
  // final List<String> litems = myStringList;
  ShowCatpers showCatpers = new ShowCatpers();
  List<Catpers> dataJson = new List();
  var repoCatpers = new FuturePreferencesRepository<Catpers>(new CatpersDesser());

  _loadListView() async {
    repoCatpers.removeAll();

    ConfigCatpers.getData(showCatpers);
    for (var data in showCatpers.ShowData()) {
      await _save(data);
    }

    repoCatpers.findAll().then((val) async {
      for (var item in val) {
        await _get(item);
      }
    });
  }

  Future _save(data) async {
    repoCatpers
        .save(Catpers(
          data.nama,
          data.warna,
        ))
        .then((data) {});
    print("data");
    print(data);
  }

  Future _get(item) async {
    setState(() {
      dataJson.add(item);
    });
    print("item");
    print(item);
  }

  @override
  void initState() {
    // TODO: implement initState
    // _loadListView();
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await _loadListView();
    print("didChangeDependencies");
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
          Container(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                // controller: _textFieldController,
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
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        dataJson[index].nama,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: new BoxDecoration(
                          color: Colors.green,
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
              itemCount: dataJson.length,
            ),
          ),
        ],
      ),
    );
  }
}
