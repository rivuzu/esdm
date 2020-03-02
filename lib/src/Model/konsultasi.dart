import 'package:esdm/src/Model/KonsultasiMessage.dart';

class Konsultasi{
  KonsultasiMessage message;
  int timetoken;

  Konsultasi({this.message,this.timetoken});
  Konsultasi.fromJson(Map<String, dynamic> json) {
    message = json['message'] != null ? new KonsultasiMessage.fromJson(json['message']) : null;
    timetoken = json['timetoken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message.toJson();
    }
    data['timetoken'] = this.timetoken;
    return data;
  }
}