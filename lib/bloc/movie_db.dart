import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/repository/movie_data_storage.dart';

class MovieDB {
  static final MovieDB _movieDB = MovieDB._internal();
  final String _url = "http://www.omdbapi.com/?apikey=fc2dadc1&";

  Map<String, dynamic> jsonData;
  MovieDB._internal();

  factory MovieDB() {
    return _movieDB;
  }

  Future<List<Movie>> searchMovies(String name) async {
    List<Movie> list = List<Movie>();

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

  Future<Movie> getMovieDetails(
      {String imdbID, String title, BuildContext context}) async {
    Movie movie;
    Map<String, dynamic> jsonDataOfMovie;
    if (imdbID != null || imdbID.isNotEmpty) {
      movie = MovieDataStorage.of(context).movies.firstWhere(
            (element) => element.imdbID == imdbID,
            orElse: () => null,
          );
      if (movie != null) {
        print("Reading Movie from storage: $movie");
        return movie;
      }
      var response = await http.get('${_url}i=$imdbID&plot=full');
      print("Network Response: ${response.body}");
      if (response.statusCode == 200) {
        jsonDataOfMovie = jsonDecode(response.body);
        movie = Movie.fromJson(jsonDataOfMovie);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } else if (title != null || title.isNotEmpty) {
      movie = MovieDataStorage.of(context).movies.firstWhere(
            (element) => element.title == title,
            orElse: () => null,
          );
      if (movie != null) {
        return movie;
      }
      var response = await http.get('${_url}t=$title&plot=full');
      print("Network Response : ${response.body}");
      if (response.statusCode == 200) {
        jsonDataOfMovie = jsonDecode(response.body);
        movie = Movie.fromJson(jsonDataOfMovie);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
    return movie;
  }
}
