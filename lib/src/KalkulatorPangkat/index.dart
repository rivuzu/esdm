import 'dart:async';

import 'package:esdm/src/Home/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class JenisUKP {
  int id;
  String name;
 
  JenisUKP(this.id, this.name);
 
  static List<JenisUKP> getJenisUKP() {
    return <JenisUKP>[
      JenisUKP(0, '-- PILIH JENIS UKP --'),
      JenisUKP(1, 'REGULER'),
      JenisUKP(2, 'PENGABDIAN')
    ];
  }
}



class Pangkat {
  int id;
  String name;
 
  Pangkat(this.id, this.name);
 
  static List<Pangkat> getPangkat() {
    return <Pangkat>[
      Pangkat(0, '-- PILIH PANGKAT --'),
      Pangkat(1, 'BRIGJEN POL'),
      Pangkat(2, 'KOMBES POL'),
      Pangkat(3, 'AKBP'),
      Pangkat(4, 'KOMPOL'),
      Pangkat(5, 'AKP'),
      Pangkat(6, 'IPTU'),
      Pangkat(7, 'IPDA')
    ];
  }
}


class Dikbang {
  int id;
  String name;
 
  Dikbang(this.id, this.name);
 
  static List<Dikbang> getDikbang() {
    return <Dikbang>[
      Dikbang(0, '-- PILIH DIKBANG --'),
      Dikbang(1, 'SESPIMMEN'),
      Dikbang(2, 'STIK'),
      Dikbang(3, 'S2 NON AKREDITASI B'),
      Dikbang(4, 'NON DIKBANG'),
      Dikbang(5, 'S2 KEDINASAN')
    ];
  }
}



class KalkulatorPangkat extends StatefulWidget {
  @override
  State createState() => _KalkulatorPangkatState();
}

class _KalkulatorPangkatState extends State<KalkulatorPangkat> {
//  WebViewController _controller;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  // final Completer<WebViewController> _controller = Completer<WebViewController>();
  List<JenisUKP> _jenisUKP = JenisUKP.getJenisUKP();
  List<DropdownMenuItem<JenisUKP>> _dropdownJenisUKP;
  JenisUKP _selectedJenisUKP;

   List<Pangkat> _listPangkat = Pangkat.getPangkat();
  List<DropdownMenuItem<Pangkat>> _dropdownPangkat;
  Pangkat _selectedPangkat;

   List<Dikbang> _listDikbang = Dikbang.getDikbang();
  List<DropdownMenuItem<Dikbang>> _dropdownDikbang;
  Dikbang _selectedDikbang;

    @override
  void initState() {
    _dropdownJenisUKP = buildDropdownUKP(_jenisUKP);
    _selectedJenisUKP = _dropdownJenisUKP[0].value;

     _dropdownPangkat = buildDropdownPangkat(_listPangkat);
    _selectedPangkat = _dropdownPangkat[0].value;

       _dropdownDikbang = buildDropdownDikbang(_listDikbang);
    _selectedDikbang = _dropdownDikbang[0].value;
    super.initState();
  }
  
  List<DropdownMenuItem<JenisUKP>> buildDropdownUKP(List UKPs) {
    List<DropdownMenuItem<JenisUKP>> items = List();
    for (JenisUKP jenisUKP in UKPs) {
      items.add(
        DropdownMenuItem(
          value: jenisUKP,
          child: Text(jenisUKP.name),
        ),
      );
    }
    return items;
  }
  
   List<DropdownMenuItem<Pangkat>> buildDropdownPangkat(List pangkats) {
    List<DropdownMenuItem<Pangkat>> items = List();
    for (Pangkat pangkat in pangkats) {
      items.add(
        DropdownMenuItem(
          value: pangkat,
          child: Text(pangkat.name),
        ),
      );
    }
    return items;
  }
 

 List<DropdownMenuItem<Dikbang>> buildDropdownDikbang(List dikbangs) {
    List<DropdownMenuItem<Dikbang>> items = List();
    for (Dikbang dikbang in dikbangs) {
      items.add(
        DropdownMenuItem(
          value: dikbang,
          child: Text(dikbang.name),
        ),
      );
    }
    return items;
  }
 
  onChangeJenisUKP(JenisUKP selectedJenisUKP) {
    setState(() {
      _selectedJenisUKP = selectedJenisUKP;
    });
  }

  
  onChangePangkat(Pangkat selectedPangkat) {
    setState(() {
      _selectedPangkat   = selectedPangkat;
    });
  }

  
  onChangeDikbang(Dikbang selectedDikbang) {
    setState(() {
      _selectedDikbang = selectedDikbang;
    });
  }


  DateTime selectedDate = DateTime.now();
 
  Future<Null> _selectDate(BuildContext context) async {
    final  DateTime newDateTime = await showRoundedDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 1),
        borderRadius: 16,
    );


     if (newDateTime != null && newDateTime != selectedDate)
      setState(() {
        selectedDate = newDateTime;
      });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "http://toekangapp.id/knp2/",
      withJavascript: true,
      withZoom: false,
      appBar: AppBar(
          title: Text("Kalkulator Pangkat"),
          elevation: 1,
          backgroundColor: Colors.brown,
      ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//
//
//return new WebviewScaffold(
//  url: 'http://toekangapp.id/knp2/',
//  hidden: true,
//  withZoom: true,
//  withLocalStorage: true,
//  withJavascript: true,
//  appBar: AppBar(title: Text("Kalkulator Pangkat")),
//);
////     return new MaterialApp(
////      debugShowCheckedModeBanner: false,
////      home: new Scaffold(
////        appBar: new AppBar(
////          title: new Text('Kalkulator Pangkat'),
////          backgroundColor: Colors.brown,
////          leading: IconButton(
////              icon: Icon(Icons.arrow_back),
////              onPressed: () {
////                Navigator
////                    .of(context)
////                    .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  Home()));
////              }),
////        ),
////
////        body:
//
////        WebView(
////          initialUrl: 'http://toekangapp.id/knp2/',
////          debuggingEnabled: true,
////          javascriptMode: JavascriptMode.unrestricted,
////          onWebViewCreated: (WebViewController webViewController) {
////            _controller.complete(webViewController);
//////            _controller = webViewController;
////          },
////        ),
//        // body: new Container(
//        //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//        //   child: Center(
//        //     child: Column(
//        //       crossAxisAlignment: CrossAxisAlignment.center,
//        //       mainAxisAlignment: MainAxisAlignment.start,
//        //       children: <Widget>[
//
//        //         new Column(
//        //           children: <Widget>[
//        //             new FormField(builder: (FormFieldState state) {
//        //               return InputDecorator(
//        //                 decoration: InputDecoration(
//        //                   labelText: 'Jenis UKP',
//        //                 ),
//        //               child: DropdownButton(
//        //                 value: _selectedJenisUKP,
//        //                 items: _dropdownJenisUKP,
//        //                 onChanged: onChangeJenisUKP,
//        //               ),
//        //               );
//        //             },
//        //             )]
//        //         ),
//
//        //         new Column(
//        //           children: <Widget>[
//        //             new FormField(builder: (FormFieldState state) {
//        //               return InputDecorator(
//        //                 decoration: InputDecoration(
//        //                   labelText: 'Pangkat',
//        //                 ),
//        //               child: DropdownButton(
//        //                   value: _selectedPangkat,
//        //                   items: _dropdownPangkat,
//        //                   onChanged: onChangePangkat,
//        //                 ),
//        //               );
//        //             },
//        //             )]
//        //         ),
//
//        //         new Column(
//        //           children: <Widget>[
//        //             new FormField(builder: (FormFieldState state) {
//        //               return InputDecorator(
//        //                 decoration: InputDecoration(
//        //                   labelText: 'Dikbang',
//        //                 ),
//        //                 child:  DropdownButton(
//        //                 value: _selectedDikbang,
//        //                 items: _dropdownDikbang,
//        //                 onChanged: onChangeDikbang,
//        //               ),
//        //               );
//        //             },
//        //             )]
//        //         ),
//
//        //         SizedBox(
//        //           height: 15.0,
//        //         ),
//        //         Text("TMT PANGKAT"),
//        //         SizedBox(
//        //           height: 10.0,
//        //         ),
//        //         new Column(
//        //           children: <Widget>[
//        //             ButtonTheme(
//        //               minWidth: 500.0,
//        //               height: 50.0,
//        //               child: RaisedButton(
//        //                 onPressed: () => _selectDate(context),
//        //                 child: Text('PILIH TANGGAL'),
//        //                 color: Colors.brown,
//        //                 textColor: Colors.white,
//        //               ),
//        //             ),
//        //             ]
//        //         ),
//
//        //         SizedBox(
//        //           height: 15.0,
//        //         ),
//        //         Text("TMT PERWIRA"),
//        //         SizedBox(
//        //           height: 10.0,
//        //         ),
//        //         new Column(
//        //           children: <Widget>[
//        //             ButtonTheme(
//        //               minWidth: 500.0,
//        //               height: 50.0,
//        //               child: RaisedButton(
//        //                 onPressed: () => _selectDate(context),
//        //                 child: Text('PILIH TANGGAL'),
//        //                 color: Colors.brown,
//        //                 textColor: Colors.white,
//        //               ),
//        //             ),
//        //             ]
//        //         ),
//        //       ],
//        //     ),
//        //   ),
//        // ),
//        // bottomNavigationBar: Container(
//        //     height: 50,
//        //     child: Row(
//        //       children: <Widget>[
//        //         Expanded(
//        //           flex: 10,
//        //           child: Container(
//        //             height: 50,
//        //             child:  RaisedButton(
//        //               onPressed: () { Navigator.push(
//        //                 context,
//        //                 MaterialPageRoute(builder: (context) => Home()),
//        //               );
//        //               },
//        //               color: Colors.brown,
//        //               child: Text("Check",style: TextStyle(color: Colors.white)),
//        //             ),
//        //           ),
//        //         ),
//        //       ],
//        //     ),
//        //   ),
////      ),
////    );
//  }
}
