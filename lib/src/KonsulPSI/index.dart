import 'package:esdm/src/KonsulPSI/konselorprofile.dart';
import 'package:esdm/src/KonsulPSI/roomchat.dart';
import 'package:flutter/material.dart';

class Pesan extends StatefulWidget {
  @override
  _PesanState createState() => _PesanState();
}

class _PesanState extends State<Pesan> {
  List name = [
    "AKBP R SAJARWO SAPUTRO, Psi",
    "KOMPOL JAROT TRI ADIONO, M.Psi",
    "PEMBINA KARTIKA W., S. PsI., M.M",
    "PENATA PUJI RAHAYU, S. Psi",
    "PENATA WORONINGROEM, S. Psi"
  ];
  List status = ["Online", "Online", "Offline", "Online", "Offline"];
  var statusColor = [
    Colors.green,
    Colors.green,
    Colors.red,
    Colors.green,
    Colors.red
  ];
  List recent = ["Baik, silahkan", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Konsultasi Psikologi'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => KonselorProfile()),
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
                            MaterialPageRoute(builder: (context) => ChatRoom()),
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
                                    name[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(recent[index],
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
                          color: statusColor[index],
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(status[index])
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
