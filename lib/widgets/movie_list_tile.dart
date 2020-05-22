import 'package:flutter/material.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/pages/movie_detail_page.dart';

//TODO Create a List Tile that contains the movie poster as leading Widget,
// Add the movie title, the year, the director, and all three ratings to be
// displayed in this widget
class MovieListTile extends StatelessWidget {
  final Movie movie;

  const MovieListTile({Key key, @required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
//    print("Movie Data: $movie");
    return ListTile(
      title: Text(movie.title),
      subtitle: Text('Directed by ${movie.director} in ' + movie.year),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MovieDetailPage(
                  imdbID: movie.imdbID,
                )));
      },
      leading: Image.network(movie.poster),
    );
  }
}
