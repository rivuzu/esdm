import 'dart:convert';

import 'package:esdm/src/Config/config_user.dart';
import 'package:esdm/src/Model/user.dart';
import 'package:pref_dessert/pref_dessert.dart';

class UserDesser extends DesSer<User>{
  @override
  User deserialize(String s) {
    var map = json.decode(s);
    return new User(
        map['id_user'] as String,
        map['email'] as String,
        map['password'] as String,
        map['nama'] as String,
        map['role'] as String,
        map['pangkat'] as String,
        map['nrp'] as String,
        map['no_hp'] as String,
        map['jabatan_id'] as int,
        map['jabatan_parent_id'] as int,
        map['jabatan_child_ids'] as List<int>
    );
  }

  @override
  String serialize(User user) {
    var map = {
      'id_user': user.id_user,
      'email': user.email,
      'password': user.password,
      'nama': user.nama,
      'role': user.role,
      'pangkat': user.pangkat,
      'nrp': user.nrp,
      'no_hp': user.no_hp,
      'jabatan_id': user.jabatan_id,
      'jabatan_parent_id': user.jabatan_parent_id,
      'jabatan_child_ids': user.jabatan_child_ids
    };
    return json.encode(map);
  }

  @override
  // TODO: implement key
  String get key => ConfigUser.user;
}