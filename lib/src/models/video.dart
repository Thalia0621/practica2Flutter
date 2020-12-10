class Videos {
  int id;
  String site;
  String key;
  List<Result> results;

  Videos({this.id,this.site,this.key,this.results});
}

class Result {
  int id;
  String site;
  String key;

factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      site: json['site'],
      key: json['key'],
    );
}
  Result({
    this.id,this.site,this.key
  });

  
}

enum OriginalLanguage { EN, JA, FR, KO }

