import 'package:esdm/src/Helper/add_user.dart';
import 'package:esdm/src/Model/user.dart';

class ConfigUser{
  static  getData(AddUser addUser){
      addUser
          .addItem(User("AAA","sajarwo@gmail.com","1234","AKBP R Sajarwo Saputro, Psi","Dokter","ABRIPDA","2893339040212456","089633451234",1,2,[1,2,3]))
          .addItem(User("BBB","jarot@gmail.com","1234","Kompol Jarot Tri Adiono, M.Psi","Dokter","BRIPDA","8493721739405933","0852229234562",2,3,[2,3]))
          .addItem(User("CCC","kartika@gmail.com","1234","Pembina Kartika W., S. Psi., M.M","Dokter","ABRIPTU","7362536488390038","021928234321",3,4,[1,3,4]))
          .addItem(User("DDD","puji_rahayu@gmail.com","1234","Penata Puji Rahayu, S.Psi","Dokter","AIPTU","9937263748329345","081992734533456",2,3,[1,4,5]))
          .addItem(User("EEE","woroningroem@gmail.com","1234","Penata Woroningroem S. Psi","Dokter","IPDA","0048392039483217","0823744459122",3,4,[1,2]))
          .addItem(User("111","ipul@gmail.com","1234","Bigjen Ipul Samudin, S.Hum.","Pasien","AIPDA","6637465723849572","08199233345934",4,1,[3,4]))
          .addItem(User("222","deno@gmail.com","1234","Kompol Deno Fambar, S.Kom","Pasien","AKP","28364627349012374","0899038828333",3,4,[1,5]))
          .addItem(User("333","juan@gmail.com","1234","AKBP Juan Aly Adi, S.Pi.","Pasien","BRIGPOL","5930310023457328","081992345692",4,2,[2,3,4]))
          .addItem(User("444","gege@gmail.com","1234","Pembina Gusti Agung Pratama, S.Kom","Pasien","BRIPTU","7293003047586921","021929222345",5,2,[2,3,4]))
          .addItem(User("555","lutfi@gmail.com","1234","Bigjen Lutfi Alghi Fahri, S.Ked","Pasien","BHARADA","53722282934500123","081229222950",3,4,[1,3,4]))
          .addItem(User("666","aghi@gmail.com","1234","Bigjen Adam Inzaghi, S.Kes.","Pasien","BHARAKA","0000293845723457","081922834772",2,5,[3,5]));
  }

  static String user = "user";
}