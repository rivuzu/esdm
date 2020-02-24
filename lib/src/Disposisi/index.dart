import 'package:flutter/material.dart';

class Disposisi extends StatefulWidget{
  @override 
  State createState() => _DisposisiState();
}

class _DisposisiState extends State<Disposisi>{

  List name = ["Khailla","Deno","Ipul","Gusti","Juan"];
  List date = ["25-02-2020","25-02-2020","25-02-2020","25-02-2020","25-02-2020"];
  List about = ["Pengaduan","Pemberitahuan","Saran","Kritik","Motivasi"];

  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Disposisi'),
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
                        Container(
                          width: 55.0,
                          height: 55.0,
                          // color: Colors.green,
                          child: CircleAvatar(
                            // backgroundColor: Colors.green,
                            foregroundColor: Colors.green,
                            backgroundImage: NetworkImage("https://img.icons8.com/doodle/48/000000/user.png"),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Dari : "+name[index], style: TextStyle(color: Colors.black,fontSize: 
                            18.0, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5.0),
                            Text("Tanggal : "+date[index], style: TextStyle(color: Colors.grey[600])),
                            Text("Prihal : "+about[index], style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      child: FlatButton(
                        onPressed: (){},
                        color: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text("Disposisi", style: TextStyle(color: Colors.white)),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
        

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.deepOrange,
          onPressed: (){

          },
        ),

    );
  }
}