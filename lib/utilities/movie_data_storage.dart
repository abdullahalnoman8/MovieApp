import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:path_provider/path_provider.dart';

class MovieDataStorage extends StatefulWidget {
//  static final MovieDataStorage _movieDataStorage =
//      MovieDataStorage._internal();

  final Widget child;

  MovieDataStorage({@required this.child});
  //  factory MovieDataStorage() {
//    return _movieDataStorage;
//  }

//  MovieDataStorage._internal() {
//    _readMovies();
//  }

  static MovieDataStorageState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedMovieDataStorage>()
        .data;
  }

  @override
  State<StatefulWidget> createState() {
    return MovieDataStorageState();
  }
}

class MovieDataStorageState extends State<MovieDataStorage> {
  List movies = List<Movie>();

  @override
  void initState() {
    _readMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedMovieDataStorage(
      child: widget.child,
      data: this,
    );
  }

  addMovie(Movie movie) {
    movies.add(movie);
    _writeMovies();
  }

  bool containsMovie(Movie movie) {
    return movies.contains(movie);
  }

  removeMovie(Movie movie) {
    movies.removeWhere((element) => element.imdbID == movie.imdbID);
    _writeMovies();
  }

  toggleMovie(Movie movie) {
    if (movies.contains(movie)) {
      removeMovie(movie);
    } else {
      addMovie(movie);
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/moviedata.txt');
  }

  Future<File> _writeMovies() async {
    final file = await _localFile;
    // Write the file.
    print("To Write::::::::::::::::::::::::::::::: $movies");
//    String jsonStringOfMovie = json.encode(movies);
    String jsonStringOfMovie =
        json.encode(movies.map((e) => e.toJson()).toList());
    print("JSON Data To Write:::::::::::::::::::::$jsonStringOfMovie");
    return file.writeAsString('$jsonStringOfMovie');
  }

  _readMovies() async {
    try {
      final file = await _localFile;
      // Read the file.
      try {
        String data = await file.readAsString();
        print('Data Found from the file: $data');
        var jsonData = json.decode(data) as List;
        setState(() {
          movies =
              jsonData.map((e) => Movie.fromJson(e)).toList(growable: true);
        });
        print("Movies Successfully Loaded from file: $movies");
      } catch (e) {
        print("@@ Data Reading Exception Found-------------- $e");
      }
    } catch (e) {
      print(e);
    }
  }
}

class _InheritedMovieDataStorage extends InheritedWidget {
  // Data is your entire state. In our case just 'User'
  final MovieDataStorageState data;

  // You must pass through a child and your state.
  _InheritedMovieDataStorage({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  // This is a built in method which you can use to check if
  // any state has changed. If not, no reason to rebuild all the widgets
  // that rely on your state.
  @override
  bool updateShouldNotify(_InheritedMovieDataStorage old) => true;
}
