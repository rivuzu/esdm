import 'package:pref_dessert/pref_dessert.dart';
import 'dart:convert';
import 'package:esdm/config/storage.dart';
import 'KenaikanPangkat.dart';

class KenaikanDesSer extends DesSer<NaikPangkat>{
  
  @override
  NaikPangkat deserialize(String s) {
      var map = json.decode(s);
      return new NaikPangkat(
        map['Nama'] as String,
        map['NRP'] as String,
        map['Nomor'] as int,
        map['Laporan'] as String,
        map['Keluhan'] as String,
        );
  }


  @override
  String serialize(NaikPangkat instance) {
      var map = {
        'Nama': instance.Nama,
        'NRP': instance.NRP,
        'Nomor': instance.Nomor,
        'Laporan': instance.Laporan,
        'Keluhan': instance.Keluhan,
      };
      return json.encode(map);
    }

  @override
  // TODO: implement key
  String get key => Storage.KENAIKANPANGKAT;

}