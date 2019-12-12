import 'dart:convert';

import 'package:movie_flutter/src/models/movie.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  String _apiKey = 'e5a497b41f25c8a53b834d854e212a8b';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
    });

    http.Response response = await http.get(url);
    Movies movies = Movies.fromJsonList(json.decode(response.body)['results']);
    
    return movies.movies;
  }

  Future<List<Movie>> getPopulars() async {
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
    });

    http.Response response = await http.get(url);
    Movies movies = Movies.fromJsonList(json.decode(response.body)['results']);
    print(movies.movies[0].originalTitle);
    return movies.movies;
  }
}