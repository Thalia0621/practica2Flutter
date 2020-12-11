
import 'package:flutter/material.dart';
import 'package:practica2/src/models/favorites.dart';
import 'package:practica2/src/utils/shared_prefs.dart';

class CardFavorites extends StatelessWidget {
  const CardFavorites({
      Key key,
      @required this.favorites
  }) : super(key: key);
  final FavoritesDAO favorites;

  @override
  Widget build(BuildContext context) {
    SharedPrefs sharedPrefs = SharedPrefs();
    return Container(
      margin:EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color:Colors.black87,
            offset:Offset(0.0,5.0),
            blurRadius: 1.0
          )
        ]
      ),
            child:ClipRRect (
              borderRadius: BorderRadius.circular(10.0),
              child: Stack(
              alignment: Alignment.bottomCenter,
              children:<Widget> [
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/activity_indicator.gif'),
                      image: NetworkImage('https://image.tmdb.org/t/p/w500/${favorites.backdropPath}'),
                      fadeInDuration: Duration(milliseconds: 100),
                    ),
                ),
                Opacity(
                      opacity: .5,
                      child: Container(
                      height: 55.0,
                      color: Colors.black,
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                            Text(favorites.title,style: TextStyle(color: Colors.white,fontSize: 12.0),),
                            //Text(trending.voteCount.toString(),style: TextStyle(color: Colors.white,fontSize: 12.0),),
                            FlatButton(
                              padding: EdgeInsets.symmetric(horizontal:10.0),
                              child:Icon(Icons.info, color: Colors.white),
                              onPressed:()async{
                                   Navigator.pushNamed(context,
                                   '/detail',arguments: {
                                     'id'       : favorites.idmovie,
                                     'title'    : favorites.title,
                                     'overview' : favorites.overview,
                                     'backdropPath':favorites.backdropPath
                                   });
                                   await sharedPrefs.setString("idMovie", favorites.idmovie.toString());
                              }
                            )
                        ],
                      ),
                    ),
                )
              ],
            ),
                  ),
          );
  }

}