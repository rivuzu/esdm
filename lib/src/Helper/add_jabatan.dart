import 'package:esdm/src/Model/Jabatan.dart';

class AddJabatan{
  List<Jabatan> _listJabatan;

  AddJabatan() {
    this._listJabatan = new List();
  }

  AddJabatan addItem(Jabatan jabatan) {
    this._listJabatan.add(jabatan);
    return this;
  }

  List<Jabatan> ShowData(){
    return this._listJabatan;
  }
}