// import 'package:pref_dessert/pref_dessert.dart';
// import 'dart:convert';
// import 'employee.dart';
// import 'package:aplikasi_leave/soap/config/storage.dart';

// class EmployeeDesSer extends DesSer<Employee>{
 
//   @override
//   Employee deserialize(String s) {
//     var map = json.decode(s);
//     return new Employee(
//         map['EmployeeId'] as String,
//       map['FullName'] as String,
//       map['RAAddress1'] as String,
//       map['RAAddress2'] as String,
//       map['RAState'] as String,
//       map['RAStateCode'] as String,
//       map['RAPost'] as int,
//       map['RAPostCode'] as int,
//       map['RACity'] as String,
//       map['RACityCode'] as String,
//       map['RACountry'] as String,
//       map['RACountryCode'] as String,
//       map['EffectiveDate'] as String,
//       map['UsePortal'] as bool,
//       map['PAAddress1'] as String,
//       map['PAAddress2'] as String,
//       map['PAState'] as String,
//       map['PAStateCode'] as String,
//       map['PAPost'] as int,
//       map['PAPostCode'] as int,
//       map['PACity'] as String,
//       map['PACityCode'] as String,
//       map['PACountry'] as String,
//       map['PACountryCode'] as String
//       );
//   }

//   @override
//   String serialize(Employee instance) {
//     var map = {
//       'EmployeeId': instance.EmployeeId,
//       'FullName': instance.FullName,
//       'RAAddress1': instance.RAAddress1,
//       'RAAddress2': instance.RAAddress2,
//       'RAState': instance.RAState,
//       'RAStateCode': instance.RAStateCode,
//       'RAPost': instance.RAPost,
//       'RAPostCode': instance.RAPostCode,
//       'RACity': instance.RACity,
//       'RACityCode': instance.RACityCode,
//       'RACountry': instance.RACountry,
//       'RACountryCode': instance.RACountryCode,
//       'EffectiveDate': instance.EffectiveDate,
//       'UsePortal': instance.UsePortal,
//       'PAAddress1': instance.PAAddress1,
//       'PAAddress2': instance.PAAddress2,
//       'PAState': instance.PAState,
//       'PAStateCode': instance.PAStateCode,
//       'PAPost': instance.PAPost,
//       'PAPostCode': instance.PAPostCode,
//       'PACity': instance.PACity,
//       'PACityCode': instance.PACityCode,
//       'PACountry': instance.PACountry,
//       'PACountryCode': instance.PACountryCode
//     };
//     return json.encode(map);
//   }

//   @override
//   // TODO: implement key
//   String get key => Storage.EMPLOYEE;
// }
