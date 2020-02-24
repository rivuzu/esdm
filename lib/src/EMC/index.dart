import 'package:esdm/src/EMC/kenaikan_pangkat.dart';
import 'package:esdm/src/EMC/mutasi_jabatan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EMC extends StatefulWidget {
  @override
  State createState() => _EMCState();
}

enum FormType { login, register }

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(4, 1),
  const StaggeredTile.count(2, 1),
];

List<Widget> _tiles = const <Widget>[
  const _KenaikanPangkat(
      Colors.black,
      Text(
        'Kenaikan Pangkat',
        style: TextStyle(color: Colors.white, fontSize: 25),
      )),
  const _MutasiJabatan(
      Colors.black,
      Text(
        'Mutasi Jabatan',
        style: TextStyle(color: Colors.white, fontSize: 25),
      )),
];

class _EMCState extends State<EMC> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('E-MC2'),
          backgroundColor: Colors.black,
        ),
        body: new Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 2,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
            )));
  }
}

class _GridMenu extends StatelessWidget {
  const _GridMenu(this.backgroundColor, this.textGrid);

  final Color backgroundColor;
  final Text textGrid;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(4.0), child: textGrid)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _KenaikanPangkat extends StatelessWidget {
  const _KenaikanPangkat(this.backgroundColor, this.textGrid);

  final Color backgroundColor;
  final Text textGrid;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KenaikanPangkat()),
              );
            },
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(4.0), child: textGrid)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MutasiJabatan extends StatelessWidget {
  const _MutasiJabatan(this.backgroundColor, this.textGrid);

  final Color backgroundColor;
  final Text textGrid;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MutasiJabatan()),
              );
            },
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(4.0), child: textGrid)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}