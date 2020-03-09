import 'package:esdm/src/Catpers/index.dart';
import 'package:esdm/src/Config/config_jabatan.dart';
import 'package:esdm/src/Config/config_message.dart';
import 'package:esdm/src/Config/config_user.dart';
import 'package:esdm/src/Helper/add_jabatan.dart';
import 'package:esdm/src/Helper/add_user.dart';
import 'package:esdm/src/Model/catpers_form.dart';
import 'package:esdm/src/Model/catpers_form_desser.dart';
import 'package:esdm/src/Model/user.dart';
import 'package:esdm/src/Model/user_desser.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:pref_dessert/pref_dessert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FormPelanggaran extends StatefulWidget {
  @override
  _FormPelanggaranState createState() => _FormPelanggaranState();
}

class _FormPelanggaranState extends State<FormPelanggaran> {
  String _id_user_combobox;
  String _id_user = "";
//  String _pelanggaranResult;
//  String _controllerResult;
  final formKey = new GlobalKey<FormState>();
  AddUser addUser = new AddUser();
  AddJabatan addJabatan = new AddJabatan();
  User user = new User("","","","","","","","",0,0,[]);
  TextEditingController _pangkatController = new TextEditingController();
  TextEditingController _nrpController = new TextEditingController();
  TextEditingController _jabatanController = new TextEditingController();
  TextEditingController _dasarCatperscontroller = new TextEditingController();
  TextEditingController _sumberLaporancontroller = new TextEditingController();
  String _radioValue; //Initial definition of radio button value
  String choice;
  var repoUser = new FuturePreferencesRepository<User>(new UserDesser());
  var repoCatpers = new FuturePreferencesRepository<CatpersForm>(new CatpersFormDesser());

  List valueDropdown = [
//    {
//      "display": "Running",
//      "value": "Running",
//    },
//    {
//      "display": "Climbing",
//      "value": "Climbing",
//    },
//    {
//      "display": "Walking",
//      "value": "Walking",
//    },
//    {
//      "display": "Swimming",
//      "value": "Swimming",
//    },
//    {
//      "display": "Soccer Practice",
//      "value": "Soccer Practice",
//    },
//    {
//      "display": "Baseball Practice",
//      "value": "Baseball Practice",
//    },
//    {
//      "display": "Football Practice",
//      "value": "Football Practice",
//    },
  ];

  @override
  void initState() {
    super.initState();
//    _controller = TextEditingController();
//    _controllerResult = '';
//    _pelanggaran = '';
//    _pelanggaranResult = '';
    ConfigUser.getData(addUser);
    ConfigJabatan.getData(addJabatan);
    setState(() {
      _radioValue = "Selesai";
    });
  }

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
    await getDataUser();
    await dataComboboxNama();
  }

  Future<void> dataComboboxNama() async{
    for(var item in addUser.ShowData()){
      print("ID USER 1 :"+item.id_user);
      print("ID USER 2 :"+_id_user);
      if(item.id_user != _id_user){
        valueDropdown.add(
            {
              "display": item.nama,
              "value": item.id_user,
            }
        ) ;
      }
    }
  }

  Future<void> getDataUser() async{
   await repoUser.findAll().then((val) async {
      if(val.length > 0){
        await repoUser.findOne(val.length - 1).then((data) async {
          if(data != null){
            await  setState(() {
              _id_user = data.id_user;
            });
          }
        });
      }
    });
  }

  getDataUserByNama(String value){
    for(var item in addUser.ShowData()){
      if(item.id_user == value){
        setState(() {
          _pangkatController.text = item.pangkat;
        });
        setState(() {
          _nrpController.text = item.nrp;
        });
        for(var item2 in addJabatan.ShowData()){
          if(item2.id == item.jabatan_id){
            setState(() {
              _jabatanController.text = item2.nama;
            });
          }
        }
      }
    }
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'Selesai':
          choice = value;
          break;
        case 'Belum Selesai':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  _saveForm() async {
//    Navigator.pop(context, false);
//    var form = formKey.currentState;
//    if (form.validate()) {
//      form.save();

//      setState(() {
//        _pelanggaranResult = _pelanggaran;
//        _controllerResult = _controller.text;
//      });
//      print(_pelanggaranResult + ' ' + _controllerResult);
//    }
    repoCatpers.save(new CatpersForm(
      _sumberLaporancontroller.text,
      _id_user_combobox,
      _pangkatController.text,
      _nrpController.text,
      _jabatanController.text,
      _dasarCatperscontroller.text,
      choice
    )).then((val) async {
     await Alert(context: context,title: ConfigMessage.DataTitleMessageInfo,type: AlertType.success, desc: ConfigMessage.DataTextMessageSuccessReporting,
        buttons: [
          DialogButton(
            child: Text(
                ConfigMessage.DataTextMessageButtonOK,style: TextStyle(color: Colors.white,fontSize: 20)
            ),
            onPressed: () => Navigator.pop(context, false),
            color: Colors.black,
          ),
        ],).show();
      Navigator
          .of(context)
          .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) =>  Catpers()));
    });
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
//                      Padding(
//                        padding: const EdgeInsets.only(left:16.0, right: 16.0, top: 16.0, bottom: 5.0),
//                        child: Text("Pengaduan Atas Nama : " + "Deno Fambar", style: TextStyle(fontSize: 15.0),),
//                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left:16,right: 16),
                                  child: TextField(
                                    // maxLines: 8,
                                    controller: _sumberLaporancontroller,
                                    decoration: InputDecoration(
                                      hintText: "Enter your text here",
                                      labelText: "Sumber Laporan",),
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              padding: EdgeInsets.all(16),
                              child: DropDownFormField(
                                titleText: 'Nama',
                                hintText: 'Please choose one',
                                value: _id_user_combobox,
                                onSaved: (value) {
                                  setState(() {
                                    _id_user_combobox = value;
                                  });
                                },
                                onChanged: (value) {
                                  getDataUserByNama(value);
                                  setState(() {
                                    _id_user_combobox = value;
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
                                    controller: _pangkatController,
                                    decoration: InputDecoration(
                                        hintText: "Enter your text here",
                                        labelText: "Pangkat",),
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left:16,right: 16),
                                  child: TextField(
                                    // maxLines: 8,
                                    controller: _nrpController,
                                    decoration: InputDecoration(
                                      hintText: "Enter your text here",
                                      labelText: "Nrp",),
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left:16,right: 16),
                                  child: TextField(
                                    // maxLines: 8,
                                    controller: _jabatanController,
                                    decoration: InputDecoration(
                                      hintText: "Enter your text here",
                                      labelText: "Jabatan",),
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left:16,right: 16),
                                  child: TextField(
                                    // maxLines: 8,
                                    controller: _dasarCatperscontroller,
                                    decoration: InputDecoration(
                                      hintText: "Enter your text here",
                                      labelText: "Dasar Catpers",),
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(left:16,right: 16,top: 16),
                                      child:
                                      Text("Status "),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Radio(
                                      value: 'Selesai',
                                      groupValue: _radioValue,
                                      onChanged: radioButtonChanges,
                                    ),
                                    Text(
                                      "Selesai",
                                    ),
                                    Radio(
                                      value: 'Belum Selesai',
                                      groupValue: _radioValue,
                                      onChanged: radioButtonChanges,
                                    ),
                                    Text(
                                      "Belum Selesai",
                                    ),
                                  ],
                                )
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
