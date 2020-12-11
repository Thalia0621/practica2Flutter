import 'dart:convert';
//CREATE TABLE tbl_favoritos(id INTEGER PRIMARY KEY,id_user INTEGER,id_movie INTEGER,title varchar(100),overview varchar(25)
class FavoritesDAO {
  int id;
  int iduser;
  int idmovie;
  String title;
  String overview;
  String backdropPath;


  

  FavoritesDAO({this.id,this.iduser,this.idmovie,this.title,this.overview,this.backdropPath});
  factory FavoritesDAO.fromJSON(Map<String,dynamic> map){
    return FavoritesDAO(
      id          :   map['id'],
      iduser      :   map['iduser'],
      idmovie     :   map['idmovie'],
      title       :   map['title'],
      overview    :   map['overview'],
      backdropPath:   map['backdropPath']
    );
  }

  Map<String,dynamic>toJSON(){
    return {
      "id"          : id,
      "iduser"      : iduser,
      "idmovie"     : idmovie,
      "title"       : title,
      "overview"    : overview,
      "backdropPath":backdropPath
    };
  }

  String userToJson(){
    final mapUser=this.toJSON();
    return json.encode(mapUser);
  }


}