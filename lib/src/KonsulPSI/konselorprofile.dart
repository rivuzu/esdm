import 'package:flutter/material.dart';

class KonselorProfile extends StatefulWidget {
  @override
  _KonselorProfileState createState() => _KonselorProfileState();
}

class _KonselorProfileState extends State<KonselorProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profil Konselor",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 80,
                  // backgroundImage: AssetImage('images/protocoder.png'),
                  child: Icon(Icons.person, size: 80.0,),
                ),
                SizedBox(height: 20.0,),
                Text(
                  'AKBP R SAJARWO SAPUTRO, Psi',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 25,
                  ),
                ),
                // Text(
                //   'Welcome',
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontFamily: 'SourceSansPro',
                //     color: Colors.red[400],
                //     letterSpacing: 2.5,
                //   ),
                // ),
                SizedBox(
                  height: 20.0,
                  width: 200,
                  child: Divider(
                    color: Colors.teal[100],
                  ),
                ),
                Text("Hanya bisa konsultasi sesuai dengan jadwal di bawah"),
                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.event_available,
                        color: Colors.teal[900],
                      ),
                      title: Text(
                        'Senin - Rabu',
                        style:
                            TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                      ),
                    )),
                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.alarm,
                      color: Colors.teal[900],
                    ),
                    title: Text(
                      '07.00 - 15.00',
                      style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
