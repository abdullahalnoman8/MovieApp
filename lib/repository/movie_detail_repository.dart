import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/networking/api_base_helper.dart';
import 'package:ninjaid/repository/movie_data_in_local_storage.dart';

class MovieDetailRepository {
  ApiBaseHelper _helper = ApiBaseHelper();
  MovieDataInFileStorage movieDataInFileStorage = MovieDataInFileStorage();

  fetchMovieDetail(String imdbID) async {
    Movie movie;
    Map<String, dynamic> jsonDataOfMovie;
    if (imdbID != null || imdbID.isNotEmpty) {
      movie = movieDataInFileStorage.readMovies().firstWhere(
          (element) => element.imdbID == imdbID,
          orElse: () => null);
//      fetchMovieDetailFromFile(imdbID);
      if (movie != null) {
        print("Reading Movie from storage: $movie");
        return movie;
      }
      var response = await _helper.get('i=$imdbID&plot=full');
      print("Network Response: ${response.toString()}");
      movie = Movie.fromJson(jsonDataOfMovie);
    }
  }

//  void fetchMovieDetailFromFile(String imdbID) {
//
//  }
}
