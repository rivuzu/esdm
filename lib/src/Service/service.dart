import 'package:http/http.dart' as http;
class Service{
 static Future<http.Response> Get(String url) async{
   try{
     var response =  await http.get(url);
     return response;
   }catch(error){
     return error;
   }
  }

 static Future<http.Response> Post(String url, dynamic dataBody) async{
   try{
     var response =  await http.post(url,body: dataBody);
     return response;
   }catch(error){
     return error;
   }
 }
}