class User{
  String id_user;
  String email;
  String password;
  String nama;
  String role;
  String pangkat;
  String nrp;
  String no_hp;
  int jabatan_id;
  int jabatan_parent_id;
  List<int> jabatan_child_ids;

  User(this.id_user,this.email,this.password,this.nama,this.role,this.pangkat,this.nrp,this.no_hp,this.jabatan_id,this.jabatan_parent_id,this.jabatan_child_ids);
}