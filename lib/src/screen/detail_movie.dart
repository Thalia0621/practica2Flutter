//import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//import 'package:video_player/video_player.dart';
import 'package:practica2/src/network/api_videos.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';

class DetailMovie extends StatefulWidget {
  // final ResultTrailer trailer;
  const DetailMovie({
    Key key,
   // this.trailer
    }) : super(key: key);

  @override
  _DetailMovieState createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  ApiVideos apiVideos=ApiVideos();
    String key;
  
  @override
  void initState() {
    super.initState();
    key="";
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
            onPressed: () {             },
          ),
          ],
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
                ),]
              );
            }
            else{
              return Center(
                 child:CircularProgressIndicator());
            }
            }
            )
      
    );
  }
}