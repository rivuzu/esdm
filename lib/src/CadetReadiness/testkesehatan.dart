import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';

class TestKesehatan extends StatefulWidget {
  @override
  _TestKesehatanState createState() => _TestKesehatanState();
}

var dataPemeriksaan = [
  {'p': "Kolestrol Total", 'h': "100", 'an': "<195 200mg/dL"},
  {'p': "HDL", 'h': "23", 'an': "<195 200mg/dL"},
  {'p': "LDL", 'h': "560", 'an': "<195 200mg/dL"},
  {'p': "Trigliserida", 'h': "-", 'an': "<195 200mg/dL"},
  {'p': "Rasio TC", 'h': "12", 'an': "<195 200mg/dL"},
  {'p': "Glukosa", 'h': "120", 'an': "<195 200mg/dL"},
  {'p': "Asam Urat", 'h': "100", 'an': "<195 200mg/dL"},
  {'p': "HemoGoblin", 'h': "100", 'an': "<195 200mg/dL"}
];

class _TestKesehatanState extends State<TestKesehatan> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Tes Kesehatan",
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Icon(
                  //   Icons.person,
                  //   size: 50,
                  //   color: Colors.blue[900],
                  // ),
                  SvgPicture.asset(
                    "lib/assets/fonts/hospital.svg",
                    color: Colors.blue[900],
                    height: 50,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            new Table(
              children: [
                new TableRow(children: [
                  Container(
                    height: 30,
                    child: new Text(
                      "Pemeriksaan",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[300]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new Text(
                    "Hasil",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[300]),
                    textAlign: TextAlign.center,
                  ),
                  new Text(
                    "Angka Normal",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[300]),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ],
            ),
            new Table(
              // border: TableBorder.all(width: 1.0, color: Colors.blue),
              border: TableBorder(
                  top: BorderSide(color: Colors.blue[300], width: 1.0),
                  verticalInside:
                      BorderSide(color: Colors.blue[300], width: 1.0)),
              children: dataPemeriksaan.map((item) {
                return new TableRow(children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 30,
                    child: Text(
                      item['p'],
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[600]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 30,
                    child: Text(
                      item['h'],
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[600]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 30,
                    child: Text(
                      item['an'],
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[600]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]);
              }).toList(),
              // children: [
              //   new TableRow(children: [
              //     new Text(
              //       "Pemeriksaan",
              //       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              //       textAlign: TextAlign.center,
              //     ),
              //     new Text(
              //       "Hasil",
              //       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              //       textAlign: TextAlign.center,
              //     ),
              //     new Text(
              //       "Angka Normal",
              //       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              //       textAlign: TextAlign.center,
              //     ),
              //   ]),

              // ],
            ),
          ],
        ),
      ),
    );
  }
}
