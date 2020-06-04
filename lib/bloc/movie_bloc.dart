import 'dart:async';

import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/networking/api_response.dart';
import 'package:ninjaid/repository/movie_repository.dart';

class MovieBloc {
  MovieRepository _movieRepository;
  StreamController _movieListController;

  StreamSink<ApiResponse<List<Movie>>> get movieListSink =>
      _movieListController.sink;

  Stream<ApiResponse<List<Movie>>> get movieListStream =>
      _movieListController.stream;

  MovieBloc(String name) {
    _movieListController = StreamController<ApiResponse<List<Movie>>>();
    _movieRepository = MovieRepository();
    searchMovies(name);
  }

  searchMovies(String name) async {
    movieListSink.add(ApiResponse.loading('Fetching Movies'));
    try {
      List<Movie> movies = await _movieRepository.searchMovies(name);
      movieListSink.add(ApiResponse.completed(movies));
    } catch (e) {
      movieListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _movieListController?.close();
  }
}
