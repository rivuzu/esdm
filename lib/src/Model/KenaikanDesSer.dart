import 'package:pref_dessert/pref_dessert.dart';
import 'dart:convert';
import 'package:esdm/src/Config/storage.dart';
import 'package:esdm/src/Model/KenaikanPangkat.dart';

class KenaikanDesSer extends DesSer<NaikPangkat>{
  
  @override
  NaikPangkat deserialize(String s) {
      var map = json.decode(s);
      return new NaikPangkat(
        map['Id'] as String,
        map['Nama'] as String,
        map['NRP'] as String,
        map['Nomor'] as String,
        map['Laporan'] as String,
        map['Keluhan'] as String,
        map['Type'] as String,
        );
  }


  @override
  String serialize(NaikPangkat instance) {
      var map = {
        'Id': instance.Id,
        'Nama': instance.Nama,
        'NRP': instance.NRP,
        'Nomor': instance.Nomor,
        'Laporan': instance.Laporan,
        'Keluhan': instance.Keluhan,
        'Type': instance.Type,
      };
      return json.encode(map);
    }

  @override
  // TODO: implement key
  String get key => Storage.KENAIKANPANGKAT;

}