import 'package:esdm/src/Home/index.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State createState() => _LoginState();
}

enum FormType { login, register }

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
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
      SizedBox(
        height: 120.0,
        child: Image.asset("lib/assets/img/sdmpolri.jpeg", fit: BoxFit.contain),
      ),
      SizedBox(
        height: 45.0,
      ),
      new TextFormField(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
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
