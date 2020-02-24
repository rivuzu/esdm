import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TryoutPSI extends StatefulWidget {
  @override
  State createState() => _TryoutPSIState();
}

class _TryoutPSIState extends State<TryoutPSI> {
  var nomorSoal = ["1","2","3","4","5","6","7","8","9","10"];
  int page = 0;

  CarouselSlider title, body;

  @override
  Widget build(BuildContext context) {
    title = CarouselSlider(
      height: 80.0,
      enableInfiniteScroll: false,
      initialPage: 0,
      onPageChanged: (index) {
        body.jumpToPage(index);
      },
      items: nomorSoal.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.amber),
              child: new Text(
                i,
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              alignment: Alignment.center,
            );
          },
        );
      }).toList(),
    );

    body = CarouselSlider(
      height: MediaQuery.of(context).size.height - 210,
      enableInfiniteScroll: false,
      initialPage: 0,
      onPageChanged: (index) {
        title.jumpToPage(index);
      },
      items: nomorSoal.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: new Text(
                i+"asd",
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              // alignment: Alignment.center,
            );
          },
        );
      }).toList(),
    );

    return new Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: new Text('Tryout PSI', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.grey[100],
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              textColor: Colors.blue,
              color: Colors.blue[100],
              onPressed: () {},
              child: Text("Selesai"),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.blue)),
            ),
          ),
        ],
      ),
      body: new ListView(
          children: <Widget>[
            new Container(margin: new EdgeInsets.only(top: 20), child: title),
            new Container(margin: new EdgeInsets.only(top: 20), child: body),
          ],
        ),
    );
  }
}
