//import 'dart:convert';
//
//import 'package:ninjaid/model/movie.dart';
//import 'package:ninjaid/networking/api_base_helper.dart';
//
//import 'movie_data_storage.dart';
//
//class MovieDetailRepository {
//  ApiBaseHelper _helper = ApiBaseHelper();
//
//  fetchMovieDetail(String imdbID, String title) {
//    Movie movie;
//    Map<String, dynamic> jsonDataOfMovie;
//    if (imdbID != null || imdbID.isNotEmpty) {
//      movie = MovieDataStorage.of(context).movies.firstWhere(
//            (element) => element.imdbID == imdbID,
//            orElse: () => null,
//          );
//      if (movie != null) {
//        print("Reading Movie from storage: $movie");
//        return movie;
//      }
//      var response = await http.get('${_url}i=$imdbID&plot=full');
//      print("Network Response: ${response.body}");
//      if (response.statusCode == 200) {
//        jsonDataOfMovie = jsonDecode(response.body);
//        movie = Movie.fromJson(jsonDataOfMovie);
//      } else {
//        print('Request failed with status: ${response.statusCode}.');
//      }
//    } else if (title != null || title.isNotEmpty) {
//      movie = MovieDataStorage.of(context).movies.firstWhere(
//            (element) => element.title == title,
//            orElse: () => null,
//          );
//      if (movie != null) {
//        return movie;
//      }
//      var response = await http.get('${_url}t=$title&plot=full');
//      print("Network Response : ${response.body}");
//      if (response.statusCode == 200) {
//        jsonDataOfMovie = jsonDecode(response.body);
//        movie = Movie.fromJson(jsonDataOfMovie);
//      } else {
//        print('Request failed with status: ${response.statusCode}.');
//      }
//    }
//    return movie;
//  }
//}
