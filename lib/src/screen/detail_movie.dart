//import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:practica2/src/databases/database_helper.dart';
import 'package:practica2/src/models/credit.dart';
import 'package:practica2/src/models/favorites.dart';
import 'package:practica2/src/network/api_credit.dart';
//import 'package:toast/toast.dart';
//import 'package:video_player/video_player.dart';
import 'package:practica2/src/network/api_videos.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';

class DetailMovie extends StatefulWidget {
 
  const DetailMovie({
    Key key,
    this.casts
    }) : super(key: key);
 final Credit casts;
 
  @override
  _DetailMovieState createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  ApiVideos apiVideos=ApiVideos();
  ApiCredits apicredits;
  DataBaseHelper db;
  Future<List<Credit>> _listCast;
    String key;
  
  @override
  void initState() {
    super.initState();
    key="";
    db= DataBaseHelper();
    apicredits = new ApiCredits();
    _listCast=apicredits.getCast();
  }
  @override
  Widget build(BuildContext context) {
    
     apiVideos.getTrailers().then((result) {
    setState(() {
       if (result is String)
             key = result.toString(); //use toString to convert as String
      
    });
    print(key+'*******');
});

    final movie=ModalRoute.of(context).settings.arguments as Map<String,dynamic>;
    return Scaffold(
        appBar: AppBar(
          title:Text('Detail: ${movie['title']}'),
          actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite,color: Colors.pink,),
            tooltip: 'Show Snackbar',
            onPressed: (){ 
               
            },
          ),
          ],
          backgroundColor: Colors.purple[200],
        ),

        body: Builder(
        builder: (BuildContext context) {
            if(key.isNotEmpty){
              return ListView(
                    children: <Widget>[
                      Container(
                        height: 250,
                    child: FlutterYoutubeView(
                          //onViewCreated: _onYoutubeCreated,
                          //listener: this,
                          scaleMode: YoutubeScaleMode.none, // <option> fitWidth, fitHeight
                          params: YoutubeParam(
                            showYoutube: true,
                            showFullScreen: true,
                                videoId: key, 
                                showUI: true,
                                startSeconds: 0.0,// <option>
                                autoPlay: true,
                          ) // <option>
                          )
                      ),
                    /* Container(
                        height: 200,
                        child:YouVimPlayer('youtube',key)),*/ //Text('Trailer :${trailer.key}')),//
                        Card( 
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.movie_filter),
                            title: Text('Movie: ${movie['title']}'),
                            subtitle:  Text('${movie["overview"]}'),
                          ),]
                      ),
                    // Text('${movie["overview"]}')),
                ),
                Card( 
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.people),
                            title: Text('Cast'),
                          ),]
                      ),
                      color: Colors.grey[300],
                    // Text('${movie["overview"]}')),
                ),
                 FutureBuilder(
                      future: _listCast,
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          print('*******+SNAPSHOT: '+snapshot.data.toString());
                          return listaCasting(snapshot.data);
                          /*ListView.builder(itemBuilder: null)
                             SizedBox(height: 150.0,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: _listCasting(snapshot.data),
                                
                              ),
                            
                          );*/
                        }
                        else if(snapshot.hasError){
                          print(snapshot.error);
                          return Text("Error");
                        }else
                        return Center(
                              child:CircularProgressIndicator());
                      },
                      ),

                
                ]);
            }
            else{
              return Center(
                 child:CircularProgressIndicator());
            }
            }
            )
      
    );
  }
  Widget listaCasting(List<Credit> casting){
    return  SizedBox(
      height: 150.0,
      child: ListView.builder(
        
        itemCount: casting.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          Credit cast=casting[index];
          return Card(
            
            child: Column(
              
              children: <Widget>[
                Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit:BoxFit.fill,
                    image: NetworkImage('https://image.tmdb.org/t/p/w500/${cast.profole}')),
                      border: Border.all(
                      color: Colors.purple[200],
                      width: 5,
                      
                    ),
                ),
                ), const SizedBox(width: 10),
                Align(alignment: Alignment.bottomCenter,child: Text(cast.name, style: TextStyle(color: Colors.purple ),))
              ],
            )
          
        ); 
      }),
    );
  }

  
}