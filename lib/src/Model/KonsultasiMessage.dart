class KonsultasiMessage{
  String message;
  String sender;
  String pasien_name;
  String dokter_name;
  String id_sender;
  String id_chat;
  String role;

  KonsultasiMessage({this.message, this.sender,this.pasien_name,this.dokter_name,this.id_sender,this.id_chat,this.role});
  KonsultasiMessage.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sender = json['sender'];
    pasien_name = json['pasien_name'];
    dokter_name = json['dokter_name'];
    id_sender = json['id_sender'];
    id_chat = json['id_chat'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['sender'] = this.sender;
    data['pasien_name'] = this.pasien_name;
    data['dokter_name'] = this.dokter_name;
    data['id_sender'] = this.id_sender;
    data['id_chat'] = this.id_chat;
    data['role'] = this.role;
    return data;
  }
}