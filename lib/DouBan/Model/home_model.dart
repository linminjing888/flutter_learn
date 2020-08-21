class Person {
  String name;
  String avatarURL;

  Person.fromMap(Map<String, dynamic> json) {
    this.name = json["name"];
    this.avatarURL = json["avatars"]["medium"];
  }
}

class Actor extends Person {
  Actor.fromMap(Map<String, dynamic> json) : super.fromMap(json);
}

class Director extends Person {
  Director.fromMap(Map<String, dynamic> json) : super.fromMap(json);
}

int counter = 1;

class MovieItem {
  int rank;
  String imageUrl;
  String title;
  String subTitle;
  String des;
  String rating;
  // List<String> genres;
  // List<Actor> casts;
  // Director director;

  MovieItem.fromMap(Map<String, dynamic> json) {
    this.rank = counter++;
    this.imageUrl = json["pic"]["normal"];
    this.title = json["title"];
    this.subTitle = json["card_subtitle"];
    this.des = json["description"];
    this.rating = (json["rating"]["value"]).toString();

    // this.genres = json["genres"].cast<String>(); //不理解
    // this.casts = (json["cats"] as List<dynamic>).map((e) {
    //   return Actor.fromMap(e);
    // }).toList();
    // this.director = Director.fromMap(json["directors"][0]);
  }
}
