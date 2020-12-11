/*class Credit {
  
  String name;
  String a;
  

  Credit(String name,String a){
    this.name=name;
    this.a=a;
  }
  
}*/

class Credit {
  bool adult;
  double popularity;
  int gender;
  int id;
  int cast_id;
  int order;
  String known_for_department;
  String name;
  String original_name;
  String profole;
  String character;
  String credit_id;

  Credit({
    this.adult,
    this.popularity,
    this.gender,
    this.id,
    this.cast_id,
    this.order,
    this.known_for_department,
    this.name,
    this.original_name,
    this.profole,
    this.character,
    this.credit_id, 
  });
  
  
  factory Credit.fromJSON(Map<String,dynamic> map){
    return Credit(
      adult                 : map['adult'],
      popularity            : map['popularity'],
      gender                : map['gender'],
      id                    : map['id'],
      cast_id               : map['cast_id'],
      order                 : map['order'],
      known_for_department  : map['known_for_department'],
      name                  : map['name'],
      original_name         : map['original_name'],
      profole          : map['profile_path'],
      character             : map['character'],
      credit_id             : map['credit_id']
    );
  }

  Map<String,dynamic> toJSON(){
    return {
      "adult"                 : adult,
      "popularity"            : popularity,
      "gender"                : gender,
      "id"                    : id,
      "cast_id"               : cast_id,
      "order"                 : order,
      "known_for_department"  : known_for_department,
      "original_name"         : original_name,
      "profile_path"          : profole,
      "character"             : character,
      "credit_id"             : credit_id,
      "name"                  : name,
    };
  }
}