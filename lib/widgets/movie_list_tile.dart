import 'package:flutter/material.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/pages/movie_detail_page.dart';
import 'package:ninjaid/utilities/movie_data_storage.dart';

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
        Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (context) => MovieDetailPage(
                      imdbID: movie.imdbID,
                    )))
            .then((value) => MovieDataStorage.of(context).setState(
                  () {},
                ));
      },
      leading: Hero(
        child: Image.network(movie.poster),
        tag: movie.imdbID,
      ),
    );
  }
}
