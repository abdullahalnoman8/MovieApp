import 'dart:convert';
import 'dart:io';

import 'package:ninjaid/model/movie.dart';

class MovieDB {
  static final MovieDB _movieDB = MovieDB._internal();
  final String _url = "http://www.omdbapi.com/?apikey=fc2dadc1&";
  final HttpClient _httpClient = new HttpClient();
  MovieDB._internal();

  factory MovieDB() {
    return _movieDB;
  }

  List<Movie> findMovies(String name) {
    _httpClient
        .getUrl(Uri.parse(_url))
        .then((request) => request.close())
        .then((response) => response.transform(Utf8Decoder()).listen(print));
    return List<Movie>();
  }
}
