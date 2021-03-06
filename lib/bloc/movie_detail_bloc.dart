import 'dart:async';

import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/networking/api_response.dart';
import 'package:ninjaid/repository/movie_detail_repository.dart';

class MovieDetailBloc {
  MovieDetailRepository _movieDetailRepository;
  StreamController _movieDetailController;

  StreamSink<ApiResponse<Movie>> get movieDetailSink =>
      _movieDetailController.sink;

  Stream<ApiResponse<Movie>> get movieDetailStream =>
      _movieDetailController.stream;

  MovieDetailBloc() {
    _movieDetailController = StreamController<ApiResponse<Movie>>();
    _movieDetailRepository = MovieDetailRepository();
  }

  fetchMovieDetail(String imdbID) async {
    movieDetailSink.add(ApiResponse.loading('Fetching Details'));
    try {
      Movie details = await _movieDetailRepository.fetchMovieDetail(imdbID);
      print('Movie Details: ' + details.toString());
      movieDetailSink.add(ApiResponse.completed(details));
    } catch (e) {
      movieDetailSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _movieDetailController?.close();
  }

  void toggleMovie(Movie movie) {
    _movieDetailRepository.toggleMovie(movie);
  }

  bool containsMovie(Movie movie) {
    return _movieDetailRepository.containsMovie(movie);
  }
}
