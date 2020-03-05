import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class FormPelanggaran extends StatefulWidget {
  @override
  _FormPelanggaranState createState() => _FormPelanggaranState();
}

class _FormPelanggaranState extends State<FormPelanggaran> {
  String _pelanggaran;
  String _pelanggaranResult;
  String _controllerResult;
  final formKey = new GlobalKey<FormState>();
  TextEditingController _controller;

  List valueDropdown = [
    {
      "display": "Running",
      "value": "Running",
    },
    {
      "display": "Climbing",
      "value": "Climbing",
    },
    {
      "display": "Walking",
      "value": "Walking",
    },
    {
      "display": "Swimming",
      "value": "Swimming",
    },
    {
      "display": "Soccer Practice",
      "value": "Soccer Practice",
    },
    {
      "display": "Baseball Practice",
      "value": "Baseball Practice",
    },
    {
      "display": "Football Practice",
      "value": "Football Practice",
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controllerResult = '';
    _pelanggaran = '';
    _pelanggaranResult = '';
  }

  _saveForm() {
    Navigator.pop(context, false);
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _pelanggaranResult = _pelanggaran;
        _controllerResult = _controller.text;
      });
      print(_pelanggaranResult + ' ' + _controllerResult);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Form Pelanggaran"),
        backgroundColor: Colors.deepOrange,
      ),
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
                child: FittedBox(
                  child: Image.asset('lib/assets/img/catpers.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Form dimana untuk mengadukan personil beserta pelanggarannya.", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:16.0, right: 16.0, top: 16.0, bottom: 5.0),
                        child: Text("Pengaduan Atas Nama : " + "Deno Fambar", style: TextStyle(fontSize: 15.0),),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(16),
                              child: DropDownFormField(
                                titleText: 'Pelanggaran',
                                hintText: 'Please choose one',
                                value: _pelanggaran,
                                onSaved: (value) {
                                  setState(() {
                                    _pelanggaran = value;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _pelanggaran = value;
                                  });
                                },
                                dataSource: valueDropdown,
                                textField: 'display',
                                valueField: 'value',
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left:16,right: 16),
                                  child: TextField(
                                    // maxLines: 8,
                                    controller: _controller,
                                    decoration: InputDecoration(
                                        hintText: "Enter your text here",
                                        labelText: "Deskripsi",),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: RaisedButton(
                                child: Text('Save'),
                                onPressed: _saveForm,
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
