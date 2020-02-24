import 'package:esdm/src/CadetReadiness/pushup.dart';
import 'package:esdm/src/CadetReadiness/situp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CadetReadiness extends StatefulWidget {
  @override
  State createState() => _CadetReadinessState();
}

enum FormType { login, register }

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(4, 1),
];

List<Widget> _tiles = const <Widget>[
  const _SitUp(
      Colors.black,
      Text(
        'Sit Up',
        style: TextStyle(color: Colors.white),
      )),
  const _PushUp(
      Colors.black,
      Text(
        'Push Up',
        style: TextStyle(color: Colors.white),
      )),
  const _GridMenu(
      Colors.black,
      Text(
        'Pull Up',
        style: TextStyle(color: Colors.white),
      )),
  const _GridMenu(
      Colors.black,
      Text(
        'Renang',
        style: TextStyle(color: Colors.white),
      )),
  const _GridMenu(
      Colors.black,
      Text(
        'Lari 8',
        style: TextStyle(color: Colors.white),
      )),
  const _GridMenu(
      Colors.black,
      Text(
        'Lari 12',
        style: TextStyle(color: Colors.white),
      )),
  const _GridMenu(
      Colors.black,
      Text(
        'Test Kesehatan',
        style: TextStyle(color: Colors.white),
      )),
];

class _CadetReadinessState extends State<CadetReadiness> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Cadet Readiness'),
          backgroundColor: Colors.amber,
        ),
        body: new Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 4,
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

class _PushUp extends StatelessWidget {
  const _PushUp(this.backgroundColor, this.textGrid);

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
            MaterialPageRoute(builder: (context) => PushUp()),
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

class _SitUp extends StatelessWidget {
  const _SitUp(this.backgroundColor, this.textGrid);

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
            MaterialPageRoute(builder: (context) => SitUp()),
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
