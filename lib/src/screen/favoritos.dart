import 'package:flutter/material.dart';
import 'package:practica2/src/databases/database_helper.dart';
import 'package:practica2/src/models/favorites.dart';
import 'package:practica2/src/views/card_favorites.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  DataBaseHelper db;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db=DataBaseHelper();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('Favorites'),
          actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite,color: Colors.pink,),
            tooltip: 'Show Snackbar',
            onPressed: (){ })],
            backgroundColor: Colors.pink[200],
        
            ),
            body: FutureBuilder(
              future: db.getallFavorites(1),  
              builder: (BuildContext context, AsyncSnapshot<List<FavoritesDAO>> snapshot){
                if(snapshot.hasError){
               return Center(
                 child: Text("Has error in this request :("),
              );
             }else if(snapshot.connectionState==ConnectionState.done){
               return _listFavorites(snapshot.data);
             }else{
               return Center(
                 child:CircularProgressIndicator(),
                 
               );
             }
              }
            ),
            
      );
             
  }

  Widget _listFavorites(List<FavoritesDAO> favorites){
      return ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context,index){
          FavoritesDAO listFav=favorites[index];
          return   CardFavorites(favorites:listFav);
           
        },
      );
  }
}
