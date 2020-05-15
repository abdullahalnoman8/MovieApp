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

  Future<List<Movie>> searchMovies(String name) async {
//    await _httpClient
//        .getUrl(Uri.parse(_url))
//        .then((request) => request.close())
//        .then((response) => response.transform(Utf8Decoder()).listen(print));

    var request = await _httpClient.getUrl(Uri.parse('${_url}t=$name'));
    var response = await request.close();
    print(response.statusCode);
    if (response.statusCode == 200) {
      response.transform(Utf8Decoder()).listen(print);
    } else {
      print('Unsuccessful Response');
    }

    return List<Movie>();
  }
}
