import 'package:esdm/src/Model/catpers.dart';

class ShowCatpers{
  List<Catpers> _listCatpers;

  ShowCatpers() {
    this._listCatpers = new List();
  }

  ShowCatpers addItem(Catpers indexDisposisi) {
    this._listCatpers.add(indexDisposisi);
    return this;
  }

  List<Catpers> ShowData(){
    return this._listCatpers;
  }
}