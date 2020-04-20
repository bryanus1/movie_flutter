class Movies {
  List<Movie> movies = List();

  Movies();

  Movies.fromJsonList(List<dynamic> jsonlist) {
    if (jsonlist == null) return;

    for (var item in jsonlist) {
      final movie = Movie.fromJson(item);
      movies.add(movie);
    }
  }

}

class Movie {

  String uniqueId;

  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Movie({
    this.voteCount,
    this.popularity,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Movie.fromJson(Map<String, dynamic> json){
    voteCount = json['vote_count'];
    popularity = json['popularity'] / 1.0;
    video = json['video'];
    posterPath = json['poster_path'];
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'];
    title = json['title'];
    voteAverage = json['vote_average'] / 1.0;
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  String getImagePath(){
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    } else {
      return 'http://www.casadei.com/on/demandware.static/Sites-casadei-Site/-/default/dw4b2b381d/images/noimagezoom.png';
    }
  }

  String getBackgroundImage(){
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$backdropPath';
    } else {
      return 'http://www.casadei.com/on/demandware.static/Sites-casadei-Site/-/default/dw4b2b381d/images/noimagezoom.png';
    }
  }
}

