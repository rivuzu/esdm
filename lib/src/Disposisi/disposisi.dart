import 'package:flutter/material.dart';

class TujuanDisposisi extends StatefulWidget{
  @override 
  State createState() => _TujuanDisposisiState();
}

class _TujuanDisposisiState extends State<TujuanDisposisi>{
  List <String> tujuan = ["Pilih Tujuan","SUBBAG RENMIN","BAG DALPRES","BAG BINKAR","BAG WATPERS","BAG PSI"];
  String _tujuan = "Pilih Tujuan";

  void pilihTujuan(String value){
    setState(() {
     _tujuan = value; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Tujuan Disposisi'),
          backgroundColor: Colors.deepOrange,
        ),
        
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new DropdownButton(
              isExpanded: true,
              value: _tujuan,
              onChanged: (String value){
                pilihTujuan(value);
              },
              items: tujuan.map((String value){
                return new DropdownMenuItem(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
            ),

            RaisedButton(
              onPressed: () {},
              color: Colors.deepOrange,
              child: const Text(
                'Forward',
                style: TextStyle(fontSize: 20,color: Colors.white)
              ),
            ),
            
          ],
        ),
      ),

    );
  }

}