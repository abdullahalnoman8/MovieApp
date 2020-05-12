import 'package:flutter/material.dart';
import 'package:ninjaid/model/movie.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${movie.name} Details '),
        backgroundColor: Colors.indigo[500],
        elevation: 0,
      ),
      body: Card(
        child: Column(
          children: <Widget>[
            Image.network(movie.imageUrl),
            Text(movie.name),
            Text('${movie.year}'),
            Text(movie.director),
            Text(movie.description)
          ],
        ),
      ),
    );
  }
}
