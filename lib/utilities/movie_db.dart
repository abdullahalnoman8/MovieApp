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
    //TODO Parse the JSON-Data and create a List of Movies from our Response
    //TODO Make sure to return an empty List, when the query , not the API call, fails
    return List<Movie>();
  }

  //TODO Create an API-Call to get movie Details based on the IMDB-ID or the movie name
  Future<Movie> getMovieDetails({String imdbID, String name}) {
    //TODO Make sure at least one of the parameters is passed in. If both are provided use the imdbID
    return null;
  }
}
