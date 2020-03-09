import 'package:esdm/src/Helper/add_jabatan.dart';
import 'package:esdm/src/Model/Jabatan.dart';

class ConfigJabatan{
  static getData(AddJabatan addJabatan){
    addJabatan
        .addItem(Jabatan(1,"KARO SDM",null))
        .addItem(Jabatan(2,"SUBBAG RENMIN",1))
        .addItem(Jabatan(3,"BAG DALPRES",1))
        .addItem(Jabatan(4,"BAG BINKAR",1))
        .addItem(Jabatan(5,"BAG WATPERS",1))
        .addItem(Jabatan(6,"BAG PSI",1))
        .addItem(Jabatan(7,"UR REN",2))
        .addItem(Jabatan(8,"UR MINTU",2))
        .addItem(Jabatan(9,"UR KEU",2))
        .addItem(Jabatan(10,"SUBBAG DIAPERS",3))
        .addItem(Jabatan(11,"SUBBAG SELEK",3))
        .addItem(Jabatan(12,"SUBBAG PNS",3))
        .addItem(Jabatan(13,"SUBBAG PANGKAT",4))
        .addItem(Jabatan(14,"SUBBAG KOMPETEN",4))
        .addItem(Jabatan(15,"SUBBAG MTJAB",4))
        .addItem(Jabatan(16,"SUBBAG ROHJASHOR",5))
        .addItem(Jabatan(17,"SUBBAG KHIRDINLUR",5))
        .addItem(Jabatan(18,"SUBBAG PSIPOL",6))
        .addItem(Jabatan(19,"SUBBAG PSIPERS",6));
  }
}