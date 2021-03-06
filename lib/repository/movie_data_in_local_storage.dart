import 'dart:convert';
import 'dart:io';

import 'package:ninjaid/model/movie.dart';
import 'package:path_provider/path_provider.dart';

class MovieDataInFileStorage {
  List movies = List<Movie>();

  MovieDataInFileStorage() {
    readMovies();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/movieList.txt');
  }

  Future<File> writeMovies() async {
    final file = await _localFile;
    // Write the file.
    print("To Write::::::::::::::::::::::::::::::: $movies");
//    String jsonStringOfMovie = json.encode(movies);
    String jsonStringOfMovie =
        json.encode(movies.map((e) => e.toJson()).toList());
    print("JSON Data To Write:::::::::::::::::::::$jsonStringOfMovie");
    return file.writeAsString('$jsonStringOfMovie');
  }

  Future<List<Movie>> readMovies() async {
    if (movies.isNotEmpty) {
      return movies;
    }
    try {
      final file = await _localFile;
      // Read the file.
      try {
        if (await file.exists()) {
          String data = await file.readAsString();
          print('Data Found from the file: $data');
          var jsonData = json.decode(data) as List;
          movies =
              jsonData.map((e) => Movie.fromJson(e)).toList(growable: true);
        }
        print("Movies Successfully Loaded from file: $movies");
      } catch (e) {
        print("-----------------File Reading Exception Found-------------- $e");
      }
    } catch (e) {
      print(e);
    }

    return movies;
  }

  addMovie(Movie movie) {
    movies.add(movie);
    writeMovies();
  }

  bool containsMovie(Movie movie) {
    return movies.contains(movie);
  }

  removeMovie(Movie movie) {
    movies.removeWhere((element) => element.imdbID == movie.imdbID);
    writeMovies();
  }

  toggleMovie(Movie movie) {
    if (movies.contains(movie)) {
      removeMovie(movie);
    } else {
      addMovie(movie);
    }
  }
}
