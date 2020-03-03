import 'package:flutter/material.dart';

class ListNama extends StatefulWidget {
  @override
  _ListNamaState createState() => _ListNamaState();
}

class _ListNamaState extends State<ListNama> {
  var items = ["Adi Mansyur", "Adi Muhammad", "Adi Setiawan", "Adi Teguh", "Aditya Radit", "Adib Pratama", "Adit Reza"];
  var colors = [Colors.red, Colors.red, Colors.green, Colors.red, Colors.green, Colors.green, Colors.red];

  @override
  Widget build(BuildContext context) {
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
                        items[index],
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: new BoxDecoration(
                          color: colors[index],
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
              itemCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}