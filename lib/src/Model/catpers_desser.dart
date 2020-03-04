import 'dart:convert';
import 'package:pref_dessert/pref_dessert.dart';
import 'catpers.dart';
import 'package:esdm/src/Config/config_catpers.dart';

class CatpersDesser extends DesSer<Catpers>{
  @override
  Catpers deserialize(String s) {
    var map = json.decode(s);
    return new Catpers(
        map['nama'] as String,
        map['warna'] as String,
    );
  }

  @override
  String serialize(Catpers catpers){
    var map = {
      'nama': catpers.nama,
      'warna': catpers.warna,
    };
    return json.encode(map);
  }

  @override
  // TODO: implement key
  String get key => ConfigCatpers.catpers;
}