import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:practica2/src/utils/shared_prefs.dart';
class ApiVideos{

 
 SharedPrefs sharedPreferences=SharedPrefs();
 Client http=Client();
 Future<String> getTrailers()async{
   String id=await sharedPreferences.getString("idMovie");
   final String URL_TRENDING="https://api.themoviedb.org/3/movie/"+id+"/videos?api_key=deefa70ddf1b399469f323e9af93e957&language=en-US";
   final response = await http.get(URL_TRENDING);
   if(response.statusCode==200){
    String trailer=jsonDecode(response.body)['results'][0]['key'];
    print("KEY...."+trailer);
    return trailer;
   
    // var trailers=jsonDecode(response.body)[]
   }else {
     throw Exception("Falló la conexión");
   }

}
}