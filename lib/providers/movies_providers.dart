// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String apiKey = '1865f43a0549ca50d341dd9ab8b29f49';
  String baseUrl = 'api.themoviedb.org';
  String language = 'es-ES';


  MoviesProvider() {
    print('movies provider');

    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url =
        Uri.https(baseUrl, '3/movie/now_playing', {
          'api_key':apiKey,
          'language': language,
          'page':'1'
        });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final Map<String, dynamic> decodeData  = json.decode(response.body);
    print(response.body);
  }
}
