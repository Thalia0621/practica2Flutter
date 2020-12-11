import 'package:flutter/widgets.dart';
import 'package:practica2/src/models/credit.dart';
import 'package:practica2/src/utils/shared_prefs.dart';
import 'dart:convert';
import 'package:http/http.dart' show Client;

class ApiCredits {
 SharedPrefs sharedPreferences=SharedPrefs();
 Client http=Client();
 Future<List<Credit>> getCast()async{
   List<Credit> lcasts=[];
   String id=await sharedPreferences.getString("idMovie");
   final String URL_TRENDING="https://api.themoviedb.org/3/movie/"+id+"/credits?api_key=deefa70ddf1b399469f323e9af93e957&language=en-US";
   final response = await http.get(URL_TRENDING);
    if(response.statusCode==200){
      print(response.body);
     var cast= jsonDecode(response.body)['cast'] as List;
     
     /*for (var item in cast) {
       lcasts.add(
         Credit(item['name'],item["profile_path"] )
       );
       
     }*/
     
     //as List;
     List<Credit> listcast=cast.map((movie) => Credit.fromJSON(movie)).toList();
     //print(cast.toString());
    //print (movies);
    return listcast;
    // var trailers=jsonDecode(response.body)[]
   }else {
     return null;
   }

}
}
