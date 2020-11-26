import 'package:flutter/material.dart';

class DetailMovie extends StatelessWidget {
  const DetailMovie({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie=ModalRoute.of(context).settings.arguments as Map<String,dynamic>;
    return Scaffold(
      appBar: AppBar(
        title:Text('Movie :${movie['title']}') ,),
        body: Center( child: Text('${movie["overview"]}')),
    );
  }
}