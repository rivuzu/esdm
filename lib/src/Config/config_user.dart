import 'package:esdm/src/Helper/add_user.dart';
import 'package:esdm/src/Model/user.dart';

class ConfigUser{
  static  getData(AddUser addUser){
      addUser
          .addItem(User("AAAA","sajarwo@gmail.com","1234","AKBP R Sajarwo Saputro, Psi","Dokter","ABRIPDA","2893339040212456","089633451234",1,2,[1,2,3]))
          .addItem(User("BBBB","jarot@gmail.com","1234","Kompol Jarot Tri Adiono, M.Psi","Dokter","BRIPDA","8493721739405933","0852229234562",2,3,[2,3]))
          .addItem(User("ABCD","riri@gmail.com","1234","Kompol Riri Wasari M. Psi","Dokter","IPDA","0048392039483217","0823744459122",3,4,[1,2]))
          .addItem(User("CCCC","kartika@gmail.com","1234","Pembina Kartika W., S. Psi., M.M","Dokter","ABRIPTU","7362536488390038","021928234321",3,4,[1,3,4]))
          .addItem(User("DCAB","dini@gmail.com","1234","Penata Dini yardina Psi","Dokter","IPDA","0048392039483217","0823744459122",3,4,[1,2]))
          .addItem(User("DDDD","puji_rahayu@gmail.com","1234","Penata Puji Rahayu, S.Psi","Dokter","AIPTU","9937263748329345","081992734533456",2,3,[1,4,5]))
          .addItem(User("CABD","agus@gmail.com","1234","Brigjen Agus Waluyo S. Psi","Dokter","IPDA","0048392039483217","0823744459122",3,4,[1,2]))
          .addItem(User("BCDA","hari@gmail.com","1234","Penata Hariyanto S. Psi","Dokter","IPDA","0048392039483217","0823744459122",3,4,[1,2]))
          .addItem(User("EEEE","woroningroem@gmail.com","1234","Penata Woroningroem S. Psi","Dokter","IPDA","0048392039483217","0823744459122",3,4,[1,2]))
          .addItem(User("1111","ipul@gmail.com","1234","Brigjen Ipul Samudin, S.Hum.","Pasien","AIPDA","6637465723849572","08199233345934",1,1,[3,4]))
          .addItem(User("2222","deno@gmail.com","1234","Kompol Deno Fambar, S.Kom","Pasien","AKP","28364627349012374","0899038828333",2,4,[1,5]))
          .addItem(User("3333","juan@gmail.com","1234","AKBP Juan Aly Adi, S.Pi.","Pasien","BRIGPOL","5930310023457328","081992345692",3,2,[2,3,4]))
          .addItem(User("4444","gege@gmail.com","1234","Pembina Gusti Agung Pratama, S.Kom","Pasien","BRIPTU","7293003047586921","021929222345",4,2,[2,3,4]))
          .addItem(User("5555","lutfi@gmail.com","1234","Brigjen Lutfi Alghi Fahri, S.Ked","Pasien","BHARADA","53722282934500123","081229222950",5,4,[1,3,4]))
          .addItem(User("6666","aghi@gmail.com","1234","Brigjen Adam Inzaghi, S.Kes.","Pasien","BHARAKA","0000293845723457","081922834772",6,5,[3,5]));
  }

  static String user = "user";
}