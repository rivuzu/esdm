import 'package:esdm/src/Model/KonsultasiMessage.dart';

class konsultasiChat{
    KonsultasiMessage message;
    String channel;
    String clientId;
    String uuid;

    konsultasiChat({this.message,this.channel,this.clientId,this.uuid});
    konsultasiChat.fromJson(Map<String, dynamic> json) {
      message = json['message'] != null ? new KonsultasiMessage.fromJson(json['message']) : null;
      channel = json['channel'];
      clientId = json['clientId'];
      uuid = json['uuid'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      if (this.message != null) {
        data['message'] = this.message.toJson();
      }
      data['channel'] = this.channel;
      data['clientId'] = this.clientId;
      data['uuid'] = this.uuid;
      return data;
    }
}