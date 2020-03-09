import 'dart:convert';

import 'package:esdm/src/Model/catpers_form.dart';
import 'package:pref_dessert/pref_dessert.dart';

class CatpersFormDesser  extends DesSer<CatpersForm>{
  @override
  CatpersForm deserialize(String s) {
    var map = json.decode(s);
    return new CatpersForm(
      map['sumber_laporan'] as String,
      map['id_user'] as String,
      map['pangkat'] as String,
      map['nrp'] as String,
      map['jabatan'] as String,
      map['dasar_catpers'] as String,
      map['status'] as String,
    );
  }

  @override
  // TODO: implement key
  String get key => null;

  @override
  String serialize(CatpersForm t) {
    var map = {
      'sumber_laporan': t.sumber_laporan,
      'id_user': t.id_user,
      'pangkat': t.pangkat,
      'nrp': t.nrp,
      'jabatan': t.jabatan,
      'dasar_catpers': t.dasar_catpers,
      'status': t.status,
    };
    return json.encode(map);
  }

}