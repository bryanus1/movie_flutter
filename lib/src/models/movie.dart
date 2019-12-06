class Response {
  List<Movie> results;
  int page;
  int totalResults;
  Dates dates;
  int totalPages;

  Response({
    this.results,
    this.page,
    this.totalResults,
    this.dates,
    this.totalPages,
  });
}

class Dates {
  String maximum;
  String minimum;

  Dates({
    this.maximum,
    this.minimum,
  });
}

class Movie {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  OriginalLanguage originalLanguage;
  String originalTitle;
  List<int> genreIds;
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
    popularity = json['popularity'];
    video = json['video'];
    posterPath = json['paster_path'];
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'];
    title = json['title'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }
}

enum OriginalLanguage { EN, JA, KO }
