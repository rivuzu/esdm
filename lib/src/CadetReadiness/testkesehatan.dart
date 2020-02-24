import 'package:flutter/material.dart';
import 'dart:async';

class TestKesehatan extends StatefulWidget {
  @override
  _TestKesehatanState createState() => _TestKesehatanState();
}

var dataPemeriksaan = [
  {'p': "Pemeriksaan", 'h': "Hasil", 'an': "Angka Normal"},
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
    return Container(
      child: new Table(
        border: TableBorder.all(),
        children: dataPemeriksaan.map((item) {
          return new TableRow(children: [
            Text(
              item['p'],
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            Text(item['h'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300)),
            Text(item['an'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300)),
          ]);
        }).toList(),
        // children: [
        //   new TableRow(children: [
        //     new Text(
        //       "Pemeriksaan",
        //       style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
        //       textAlign: TextAlign.center,
        //     ),
        //     new Text(
        //       "Hasil",
        //       style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
        //       textAlign: TextAlign.center,
        //     ),
        //     new Text(
        //       "Angka Normal",
        //       style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
        //       textAlign: TextAlign.center,
        //     ),
        //   ]),

        // ],
      ),
    );
  }
}
