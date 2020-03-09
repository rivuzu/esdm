import 'dart:convert';

import 'package:esdm/src/Config/config_indexdisposisi.dart';
import 'package:pref_dessert/pref_dessert.dart';
import 'package:esdm/src/Model/indexDisposisi.dart';

class IndexDisposisiDesser extends DesSer<IndexDisposisi>{
  @override
  IndexDisposisi deserialize(String s) {
    var map = json.decode(s);
    return new IndexDisposisi(
        map['nama'] as String,
        map['tanggal'] as String,
        map['keperluan'] as String,
        map['id_jabatan'] as String,
        map['id_user'] as String
    );
  }

  @override
  String serialize(IndexDisposisi indexDisposisi){
    var map = {
      'nama': indexDisposisi.nama,
      'tanggal': indexDisposisi.tanggal,
      'keperluan': indexDisposisi.keperluan,
      'owner': indexDisposisi.id_jabatan,
      'id_user': indexDisposisi.id_user
    };
    return json.encode(map);
  }

  @override
  // TODO: implement key
  String get key => ConfigIndexDisposisi.indexDisposisi;
}