import 'dart:async';
import 'dart:convert';

import 'package:movie_flutter/src/models/actor.dart';
import 'package:movie_flutter/src/models/movie.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  String _apiKey = 'e5a497b41f25c8a53b834d854e212a8b';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _page = 0;
  List<Movie> _populars = List();
  bool _cargando = false;

  final _popularStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularSink => _popularStreamController.sink.add;
  Stream<List<Movie>> get popularStream => _popularStreamController.stream;


  void dispose() {
    _popularStreamController?.close();
  }

  Future _processData({String endpoint, int page = 1, bool cast = false}) async {
    final url = Uri.https(_url, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': page.toString()
    });

    http.Response response = await http.get(url);
    if (cast) {
      Actors actors = Actors.fromJsonList(json.decode(response.body)['cast']);
      return actors.actors;
    } else {
      Movies movies = Movies.fromJsonList(json.decode(response.body)['results']);
      return movies.movies;
    }
  }

  Future<List<Movie>> getNowPlaying() async => await _processData(endpoint: '3/movie/now_playing');
  Future<List<Actor>> getActors(String movieId) async => await _processData(endpoint: '3/movie/$movieId/credits', cast: true);
  Future<List<Movie>> getPopulars() async {
    if (_cargando) return [];
    
    _cargando = true;

    _page++;
    final resp = await _processData(endpoint: '3/movie/popular', page: _page);

    _populars.addAll(resp);
    popularSink(_populars);

    _cargando = false;

    return resp;
  }
}