


import 'package:flutter/material.dart';
import 'package:practica2/src/models/credit.dart';
import 'package:practica2/src/network/api_credit.dart';
import 'package:practica2/src/screen/detail_movie.dart';

class Cast extends StatefulWidget {
  Cast({Key key}) : super(key: key);
  
  @override
  _CastState createState() => _CastState();
}

class _CastState extends State<Cast> {
  ApiCredits apiCredits;
Future<List<Credit>>_listCast;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCredits=ApiCredits();
    _listCast=apiCredits.getCast();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title:  Text("Cast")),
      body: FutureBuilder(
        future: _listCast,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            print(snapshot.data);
            return listCasts(snapshot.data);
          }
          else if(snapshot.hasError){
            print(snapshot.error);
            return Text("Error");
          }else
          return Center(
                 child:CircularProgressIndicator());
        },
        ),  
    );
  }
  Widget listCasts(List<Credit>cast){
    return ListView.builder(
      itemCount: cast.length,
      itemBuilder: (context,index){
          Credit casts=cast[index];
          return DetailMovie(casts: casts);
      },
   
    );
  }

}