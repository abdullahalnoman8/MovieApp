import 'dart:convert';
import 'dart:io';

import 'package:ninjaid/model/movie.dart';
import 'package:path_provider/path_provider.dart';

class MovieDataStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/moviedata.txt');
  }

  Future<File> writeMovie(List<Movie> movie) async {
    final file = await _localFile;

//    print("Data Written :: $movie");
    // Write the file.
    print("To Write::::::::::::::::::::::::::::::: $movie");
    String jsonStringOfMovie = json.encode(movie);
    print("JSON Data To Write:::::::::::::::::::::$jsonStringOfMovie");
    return file.writeAsString('$jsonStringOfMovie');
  }

  Future<File> writeMovieList(List<Movie> movies) async {
    final file = await _localFile;

    // Write the file.
    print("Data Written :: $movies");
    return file.writeAsString('$movies');
  }

  Future<List<Movie>> readMovie() async {
    List<Movie> list = new List<Movie>();
    try {
      final file = await _localFile;
      // Read the file.
      try {
        String data = await file.readAsString();
        print('Data Found from the file: $data');
        list = json.decode(data);
//        print('Decoded Stored Data: $ab');
//        print(ab);
//        list = ab;
//        list.add(data);
      } catch (e) {
        print("@@ Data Reading Exception Found-------------- $e");
      }
      return list;
    } catch (e) {
      // If encountering an error, return 0.
      return list;
    }
  }
}
