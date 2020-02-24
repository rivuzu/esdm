import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TryoutPSI extends StatefulWidget {
  @override
  State createState() => _TryoutPSIState();
}

class _TryoutPSIState extends State<TryoutPSI> {
  var nomorSoal = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  var soal = [
    "Pengaruh seseorang terhadap orang lain seharusnya bergantung pada",
    "Lawannya 'hemat' ialah",
    "............................ tidak termasuk cuaca",
    "Lawannya 'setia' adalah",
    "Seekor kuda selalu mempunyai",
    "Seorang paman ......... lebih tua dari pada keponakannya.",
    "Pada jumlah yang sama, nilai kalori yang tertinggi terdapat pada",
    "Pada suatu pertandingan selalu terdapat",
    "Suatu pernyataan yang belum dipastikan dikatakan sebagai pernyataan yang",
    "Pada sepatu selalu terdapat"
  ];
  var jawabanA = [
    "kekuasaan",
    "murah",
    "angin puyuh",
    "cinta",
    "kandang",
    "jarang",
    "ikan",
    "lawan",
    "paradoks",
    "kulit"
  ];
  var jawabanB = [
    "bujukan",
    "kikir",
    "halilintar",
    "benci",
    "ladam",
    "biasanya",
    "daging",
    "wasit",
    "tergesa-gesa",
    "sol"
  ];
  var jawabanC = [
    "kekayaan",
    "boros",
    "salju",
    "persahabatan",
    "pelana",
    "selalu",
    "lemak",
    "penonton",
    "mempunyai arti rangkap",
    "tali sepatu"
  ];
  var jawabanD = [
    "keberanian",
    "bernilai",
    "gempa bumi",
    "khianat",
    "kuku",
    "tak pernah",
    "tahu",
    "tahu",
    "sorak",
    "menyesatkan",
    "gesper"
  ];
  var jawabanE = [
    "kewibawaan",
    "kaya",
    "kabut",
    "permusuhan",
    "surai",
    "kadang-kadang",
    "sayuran",
    "kemenangan",
    "hipotesis",
    "lidah"
  ];
  int page = 0;

  CarouselSlider title,
      body,
      answerA,
      answerB,
      answerC,
      answerD,
      answerE,
      button;

  @override
  Widget build(BuildContext context) {
    title = CarouselSlider(
      height: 80.0,
      enableInfiniteScroll: false,
      initialPage: 0,
      onPageChanged: (index) {
        button.jumpToPage(index);
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
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
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
      height: 50,
      enableInfiniteScroll: false,
      initialPage: 0,
      onPageChanged: (index) {
        title.jumpToPage(index);
      },
      items: soal.map((i) {
        return Column(
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: new Text(
                    i,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  // alignment: Alignment.center,
                );
              },
            ),
          ],
        );
      }).toList(),
    );

    answerA = CarouselSlider(
      height: 30,
      enableInfiniteScroll: false,
      initialPage: 0,
      onPageChanged: (index) {
        body.jumpToPage(index);
      },
      items: jawabanA.map((i) {
        return Column(
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: new Text(
                    '(A) ' + i,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  // alignment: Alignment.center,
                );
              },
            ),
          ],
        );
      }).toList(),
    );

    answerB = CarouselSlider(
      height: 30,
      enableInfiniteScroll: false,
      initialPage: 0,
      onPageChanged: (index) {
        answerA.jumpToPage(index);
      },
      items: jawabanB.map((i) {
        return Column(
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: new Text(
                    '(B) ' + i,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  // alignment: Alignment.center,
                );
              },
            ),
          ],
        );
      }).toList(),
    );

    answerC = CarouselSlider(
      height: 30,
      enableInfiniteScroll: false,
      initialPage: 0,
      onPageChanged: (index) {
        answerB.jumpToPage(index);
      },
      items: jawabanC.map((i) {
        return Column(
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: new Text(
                    '(C) ' + i,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  // alignment: Alignment.center,
                );
              },
            ),
          ],
        );
      }).toList(),
    );

    answerD = CarouselSlider(
      height: 30,
      enableInfiniteScroll: false,
      initialPage: 0,
      onPageChanged: (index) {
        answerC.jumpToPage(index);
      },
      items: jawabanD.map((i) {
        return Column(
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: new Text(
                    '(D) ' + i,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  // alignment: Alignment.center,
                );
              },
            ),
          ],
        );
      }).toList(),
    );

    answerE = CarouselSlider(
      height: 30,
      enableInfiniteScroll: false,
      initialPage: 0,
      onPageChanged: (index) {
        answerD.jumpToPage(index);
      },
      items: jawabanE.map((i) {
        return Column(
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: new Text(
                    '(E) ' + i,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  // alignment: Alignment.center,
                );
              },
            ),
          ],
        );
      }).toList(),
    );

    button = CarouselSlider(
      height: 100,
      enableInfiniteScroll: false,
      initialPage: 0,
      onPageChanged: (index) {
        answerE.jumpToPage(index);
      },
      items: soal.map((i) {
        return Column(
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FloatingActionButton(
                        backgroundColor: Colors.grey[200],
                        child: Text("A",style: TextStyle(color: Colors.black),),
                        elevation: 5,
                        onPressed: () => {},
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.grey[200],
                        child: Text("B",style: TextStyle(color: Colors.black),),
                        elevation: 5,
                        onPressed: () => {},
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.grey[200],
                        child: Text("C",style: TextStyle(color: Colors.black),),
                        elevation: 5,
                        onPressed: () => {},
                      ),FloatingActionButton(
                        backgroundColor: Colors.grey[200],
                        child: Text("D",style: TextStyle(color: Colors.black),),
                        elevation: 5,
                        onPressed: () => {},
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.grey[200],
                        child: Text("E",style: TextStyle(color: Colors.black),),
                        elevation: 5,
                        onPressed: () => {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      }).toList(),
    );

    return new Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: new Text(
          'Tryout PSI',
          style: TextStyle(color: Colors.black),
        ),
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
          new Container(margin: new EdgeInsets.only(top: 0), child: answerA),
          new Container(margin: new EdgeInsets.only(top: 0), child: answerB),
          new Container(margin: new EdgeInsets.only(top: 0), child: answerC),
          new Container(margin: new EdgeInsets.only(top: 0), child: answerD),
          new Container(margin: new EdgeInsets.only(top: 0), child: answerE),
          new Container(margin: new EdgeInsets.only(top: 0), child: button),
        ],
      ),
    );
  }
}
