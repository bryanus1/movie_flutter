class Actors {
  List<Actor> actors = List();

  Actors.fromJsonList(List<dynamic> jsonlist) {
    if (jsonlist == null) return;

    jsonlist.forEach((item){
      final actor = Actor.fromJson(item);
      actors.add(actor);
    });
  }
}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJson(Map<String, dynamic> json){
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  String getImage(){
    if (profilePath != null) {
      return 'https://image.tmdb.org/t/p/w500$profilePath';
    } else {
      return 'http://support.securepoint.de/styles/canvas/theme/images/no_avatar.jpg';
    }
  }
}
