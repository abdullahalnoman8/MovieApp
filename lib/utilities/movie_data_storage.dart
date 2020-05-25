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

  Future<File> writeMovie(Movie movie) async {
    final file = await _localFile;

    print("Data Written :: $movie");
    // Write the file.
    return file.writeAsString('$movie');
  }

  Future<List<Movie>> readMovie() async {
    List<Movie> list = new List<Movie>();
    try {
      final file = await _localFile;
      // Read the file.
//      String contents = await file.readAsString();
      list = (await file.readAsString()) as List<Movie>;
      print("Reading the Data File :: $file -> $list");
      return list;
    } catch (e) {
      // If encountering an error, return 0.
      return list;
    }
  }
}
