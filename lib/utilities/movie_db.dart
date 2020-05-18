import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:ninjaid/model/movie.dart';

class MovieDB {
  static final MovieDB _movieDB = MovieDB._internal();
  final String _url = "http://www.omdbapi.com/?apikey=fc2dadc1&";
  final HttpClient _httpClient = new HttpClient();
  Client http = new Client();
  Map<String, dynamic> jsonData;
  Movie jsonDataOfMovie;
  MovieDB._internal();

  factory MovieDB() {
    return _movieDB;
  }

  Future<List<Movie>> searchMovies(String name) async {
    List<Movie> list = List<Movie>();
//    await _httpClient
//        .getUrl(Uri.parse(_url))
//        .then((request) => request.close())
//        .then((response) => response.transform(Utf8Decoder()).listen(print));
//    var request = await _httpClient.getUrl(Uri.parse('${_url}t=$name'));
//    var response = await request.close();
//    print(response.statusCode);
//    if (response.statusCode == 200) {
//      await for (var data in response.transform(Utf8Decoder()))
//        jsonData = json.decode(data) as Map<String, dynamic>;
//      print(jsonData);
//    } else {
//      print('Unsuccessful Response');
//    }

    var response = await http.get(Uri.parse('${_url}s=$name'));
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      List movieData = jsonData['Search'] as List ?? [];
      for (var data in movieData) list.add(Movie.fromJson(data));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return list;
  }

  //TODO Create an API-Call to get movie Details based on the IMDB-ID or the movie name
  Future<Movie> getMovieDetails({String imdbID, String name}) async {
    //TODO Make sure at least one of the parameters is passed in. If both are provided use the imdbID
    Movie movie;
    if (imdbID != null && name != null) {
      var response = await http.get(Uri.parse('${_url}i=$imdbID'));
      if (response.statusCode == 200) {
        jsonDataOfMovie = jsonDecode([] as Movie ?? "");
        movie = Movie.fromJson(jsonDataOfMovie);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } else if (imdbID != null || name != null) {
      var response = await http.get(Uri.parse('${_url}n=$name'));
      if (response.statusCode == 200) {
        jsonDataOfMovie = jsonDecode([] as Movie ?? "");
        movie = Movie.fromJson(jsonDataOfMovie);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
    return movie;
  }
}
