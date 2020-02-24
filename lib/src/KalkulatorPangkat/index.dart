import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class JenisUKP {
  int id;
  String name;
 
  JenisUKP(this.id, this.name);
 
  static List<JenisUKP> getJenisUKP() {
    return <JenisUKP>[
      JenisUKP(0, '-- JENIS UKP --'),
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
      Pangkat(0, '-- PANGKAT --'),
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
      Dikbang(0, '-- DIKBANG --'),
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
 
  onChangeDropdownItem(JenisUKP selectedJenisUKP) {
    setState(() {
      _selectedJenisUKP = selectedJenisUKP;
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

     

     return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Kalkulator Pangkat"),
        ),
        body: new Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                DropdownButton(
                        value: _selectedJenisUKP,
                        items: _dropdownJenisUKP,
                        onChanged: onChangeDropdownItem,
                      ),
                SizedBox(
                  height: 10.0,
                ),
                DropdownButton(
                  value: _selectedPangkat,
                  items: _dropdownPangkat, onChanged: (Pangkat value) {  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                DropdownButton(
                  value: _selectedDikbang,
                  items: _dropdownDikbang, onChanged: (Dikbang value) {  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text("TMT PANGKAT"),
                RaisedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('PILIH TANGGAL'),
                ),
                Text("TMT PERWIRA"),
                RaisedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('PILIH TANGGAL'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () => {},
                  child: Text('CHECK'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
