import 'package:shared_preferences/shared_preferences.dart';

class  Preferences{

  static setData(String key,String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    return prefs.commit();
  }

  static Future<String>  getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//    print("DATA SAYA : " +prefs.get(key));
    return prefs.getString(key) ?? '';
  }

  static removeAllData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static removeData(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}

