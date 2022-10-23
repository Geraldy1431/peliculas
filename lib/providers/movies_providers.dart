// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/movies.dart';

class MoviesProvider extends ChangeNotifier {
  String apiKey = '2199cac57e6177baf5497e3b18e66807';
  String baseUrl = 'api.themoviedb.org';
  String language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularpage = 0;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(baseUrl, endpoint,
        {'api_key': apiKey, 'language': language, 'page': '$page'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');

    // Await the http get response, then decode the json-formatted response.
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularpage++;
    final jsondata = await _getJsonData('3/movie/popular', _popularpage);

    final popularResponse = PopularResponse.fromJson(jsondata);
    popularMovies = [...popularMovies, ...popularResponse.results];
    print(popularMovies[0]);
    notifyListeners();
  }
}
