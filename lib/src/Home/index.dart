import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),

  //GRID MENU

  const StaggeredTile.count(4, 1),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(4, 1),
];

List<Widget> _tiles = const <Widget>[
  const _Example02Tile(Colors.white),
  const _Example03Tile(Colors.black),

  //GRID MENU

  // const _Example01Tile(Colors.black, Icons.widgets, Text('Catpers', style: TextStyle(color: Colors.white),)),
  // const _Example01Tile(Colors.grey, Icons.keyboard_arrow_up, Text('Kalkulator Pangkat', style: TextStyle(color: Colors.white),)),
  // const _Example01Tile(Colors.grey, Icons.markunread, Text('Disposisi', style: TextStyle(color: Colors.white),)),
  // const _Example01Tile(Colors.black, Icons.chat, Text('EMC2', style: TextStyle(color: Colors.white),)),
  // const _Example01Tile(Colors.black, Icons.directions_run, Text('Cadet Readiness', style: TextStyle(color: Colors.white),)),
  // const _Example01Tile(Colors.grey, Icons.note, Text('Tryout Psi', style: TextStyle(color: Colors.white),)),

  const _Example01Tile(Colors.green, Icons.widgets, Text('Catpers', style: TextStyle(color: Colors.white),)),
  const _Example01Tile(Colors.amber, Icons.directions_run, Text('Cadet Readiness', style: TextStyle(color: Colors.white),)),
  const _Example01Tile(Colors.black, Icons.chat, Text('EMC2', style: TextStyle(color: Colors.white),)),
  const _Example01Tile(Colors.deepOrange, Icons.markunread, Text('Disposisi', style: TextStyle(color: Colors.white),)),
  const _Example01Tile(Colors.brown, Icons.keyboard_arrow_up, Text('Kalkulator Pangkat', style: TextStyle(color: Colors.white),)),
  const _Example01Tile(Colors.red, Icons.note, Text('Tryout Psi', style: TextStyle(color: Colors.white),)),

  // const _Example01Tile(Colors.green, Icons.widgets, Text('Catpers', style: TextStyle(color: Colors.white),)),
  // const _Example01Tile(Colors.amber, Icons.keyboard_arrow_up, Text('Kalkulator Pangkat', style: TextStyle(color: Colors.white),)),
  // const _Example01Tile(Colors.black, Icons.markunread, Text('Disposisi', style: TextStyle(color: Colors.white),)),
  // const _Example01Tile(Colors.deepOrange, Icons.chat, Text('EMC2', style: TextStyle(color: Colors.white),)),
  // const _Example01Tile(Colors.brown, Icons.directions_run, Text('Cadet Readiness', style: TextStyle(color: Colors.white),)),
  // const _Example01Tile(Colors.red, Icons.note, Text('Tryout Psi', style: TextStyle(color: Colors.white),)),

];

class Home extends StatefulWidget {
  @override
  State createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Dashboard E-SDM'),
          backgroundColor: Colors.black,
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

class _Example02Tile extends StatelessWidget{
  const _Example02Tile(this.backgroundColor);

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new SizedBox(
          child: Image.asset("lib/assets/img/pmj.png", fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class _Example03Tile extends StatelessWidget{
  const _Example03Tile(this.backgroundColor);

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new SizedBox(
          child: Image.asset("lib/assets/img/sdmpolri.jpeg", fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.backgroundColor, this.iconData, this.textGrid);

  final Color backgroundColor;
  final IconData iconData;
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
                    //text
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(iconData, color: Colors.white, size: 40.0,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: textGrid
                      )
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
