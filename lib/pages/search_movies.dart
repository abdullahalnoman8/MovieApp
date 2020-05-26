import 'package:flutter/material.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/utilities/movie_db.dart';
import 'package:ninjaid/widgets/movie_list_tile.dart';

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
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: textEditingController,
            ),
            //TODO Create a ListView which will shows all the Movies that match our search.
            //TODO Create a Custom MovieListTile Widget for that purpose. (the same we use in the HomePage)

            Expanded(
              child: ListView.builder(
                itemCount: movieList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => MovieListTile(
                  movie: movieList[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  searchMovies() {
    MovieDB().searchMovies(textEditingController.value.text).then((value) {
      if (this.mounted)
        setState(() {
          movieList = value;
        });
    });
  }
}
