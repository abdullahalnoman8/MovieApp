import 'package:flutter/material.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/utilities/movie_db.dart';

class SearchMovie extends StatefulWidget {
  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  TextEditingController textEditingController;
  List<Movie> movieList = [];

  @override
  void initState() {
    super.initState();
    textEditingController = new TextEditingController();
    textEditingController.addListener(searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Movie'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: textEditingController,
          ),
        ],
      ),
    );
  }

  searchMovies() {
    MovieDB().searchMovies(textEditingController.value.text);
  }
}
