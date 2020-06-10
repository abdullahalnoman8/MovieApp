import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/networking/api_base_helper.dart';
import 'package:ninjaid/repository/movie_data_in_local_storage.dart';

class MovieDetailRepository {
  ApiBaseHelper _helper = ApiBaseHelper();
  MovieDataInFileStorage movieDataInFileStorage = MovieDataInFileStorage();

  Future<Movie> fetchMovieDetail(String imdbID) async {
    Movie movie;
    Map<String, dynamic> jsonDataOfMovie;
    if (imdbID != null || imdbID.isNotEmpty) {
      movie = (await movieDataInFileStorage.readMovies()).firstWhere(
          (element) => element.imdbID == imdbID,
          orElse: () => null);
      if (movie != null) {
        print("Reading Movie from storage: $movie");
        return movie;
      }
      var response = await _helper.get('i=$imdbID&plot=full');
      print("Network Response: ${response.toString()}");
      return movie = Movie.fromJson(response);
    }
  }

  void toggleMovie(Movie movie) {
    movieDataInFileStorage.toggleMovie(movie);
  }

  bool containsMovie(Movie movie) {
    return movieDataInFileStorage.containsMovie(movie);
  }
}
