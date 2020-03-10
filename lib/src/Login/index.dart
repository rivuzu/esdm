import 'package:esdm/src/Config/config_message.dart';
import 'package:esdm/src/Config/config_user.dart';
import 'package:esdm/src/Helper/add_user.dart';
import 'package:esdm/src/Home/index.dart';
import 'package:esdm/src/Model/user.dart';
import 'package:esdm/src/Model/user_desser.dart';
import 'package:flutter/material.dart';
import 'package:pref_dessert/pref_dessert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Login extends StatefulWidget {
  @override
  State createState() => _LoginState();
}

enum FormType { login, register }

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final formKey = new GlobalKey<FormState>();
  var repoUser = new FuturePreferencesRepository<User>(new UserDesser());

  AddUser addUser = new AddUser();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  void initState() {
    super.initState();
    try{
      ConfigUser.getData(addUser);
    }catch (exception) {
    }
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  cekLogin(String username,String password){
    for(var item in addUser.ShowData()){
      print("Username : "+item.email);
      print("Password : "+item.password);
       if(username.trim() == item.email && password.trim() == item.password){
          repoUser.removeAll();
          repoUser.save(
              new User(
                  item.id_user,
                  item.email,
                  item.password,
                  item.nama,
                  item.role,
                  item.pangkat,
                  item.nrp,
                  item.no_hp,
                  item.jabatan_id,
                  item.jabatan_parent_id,
                  item.jabatan_child_ids
              )
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
          return "";
        }
    }

    print("Username : "+username);
    print("Password : "+password);
    if(username.trim() == ""){
      Alert(context: context, title: ConfigMessage.DataTitleMessageWarning,type: AlertType.warning, desc: ConfigMessage.DataTextMessageUsernameEmpty,
        buttons: [
          DialogButton(
            child: Text(
                ConfigMessage.DataTextMessageButtonOK,style: TextStyle(color: Colors.white,fontSize: 20)
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.black,
          ),
        ],).show();
      return "";
    }else if(password.trim() == ""){
      Alert(context: context, title: ConfigMessage.DataTitleMessageWarning,type: AlertType.warning, desc: ConfigMessage.DataTextMessagePasswordEmpty,
        buttons: [
          DialogButton(
            child: Text(
                ConfigMessage.DataTextMessageButtonOK,style: TextStyle(color: Colors.white,fontSize: 20)
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.black,
          ),
        ],).show();
      return "";
    }else{
      Alert(context: context, title: ConfigMessage.DataTitleMessageWarning,type: AlertType.warning, desc: ConfigMessage.DataTextMessageUsernameOrPasswordError,
        buttons: [
          DialogButton(
            child: Text(
                ConfigMessage.DataTextMessageButtonOK,style: TextStyle(color: Colors.white,fontSize: 20)
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.black,
          ),
        ],).show();
      return "";
    }
  }

  void validateAndSubmit() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  void moveToRegister() {
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: new Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildInputs() + buildSubmitButton(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center ,
        crossAxisAlignment: CrossAxisAlignment.center ,
        children: <Widget>[
          SizedBox(
            height: 130.0,
            child: Image.asset("lib/assets/img/pmj.png", fit: BoxFit.contain),
          ),
          SizedBox(
            height: 120.0,
            child: Image.asset("lib/assets/img/sdmpolri.jpeg", fit: BoxFit.contain),
          ),
        ],
      ),
      SizedBox(
        height: 45.0,
      ),
      new TextFormField(
        controller: _usernameController,
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Email",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        validator: (value) => value.isEmpty ? "Email jangan kosong" : null,
      ),
      SizedBox(
        height: 25.0,
      ),
      new TextFormField(
        controller: _passwordController,
        obscureText: true,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        validator: (value) => value.isEmpty ? "Password jangan kosong" : null,
      ),
    ];
  }

  List<Widget> buildSubmitButton() {
    if (_formType == FormType.login) {
      return [
        SizedBox(
          height: 35.0,
        ),
        new Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          // color: Color(0xff01A0C7),
          color: Colors.orange,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              cekLogin(_usernameController.text.trim(),_passwordController.text.trim());
            },
            child: Text("Login",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        new Material(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          child: MaterialButton(
            onPressed: moveToRegister,
            child: Text(" ",
                textAlign: TextAlign.center,
                style: style.copyWith(color: Colors.black, fontSize: 18)),
          ),
        )
      ];
    } else {
      return [
        SizedBox(
          height: 35.0,
        ),
        new Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: validateAndSave,
            child: Text("Register",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        new Material(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          child: MaterialButton(
            onPressed: moveToLogin,
            child: Text("Kembali",
                textAlign: TextAlign.center,
                style: style.copyWith(color: Colors.black, fontSize: 18)),
          ),
        )
      ];
    }
  }
}
