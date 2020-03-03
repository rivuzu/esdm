import 'package:esdm/src/Model/indexDisposisi.dart';

class ShowIndexDisposisi{
  List<IndexDisposisi> _listIndexDisposisi;

  ShowIndexDisposisi() {
    this._listIndexDisposisi = new List();
  }

  ShowIndexDisposisi addItem(IndexDisposisi indexDisposisi) {
    this._listIndexDisposisi.add(indexDisposisi);
    return this;
  }

  List<IndexDisposisi> ShowData(){
    return this._listIndexDisposisi;
  }
}