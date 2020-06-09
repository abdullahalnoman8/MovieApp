import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/networking/api_base_helper.dart';

class MovieRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Movie>> searchMovies(String name) async {
    List<Movie> list = List<Movie>();
    final response = await _helper.get('s=$name');
    List movieData = response['Search'] as List ?? [];
    for (var data in movieData) list.add(Movie.fromJson(data));
    return list;
  }
}
