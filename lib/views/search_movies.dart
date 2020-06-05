import 'package:flutter/material.dart';
import 'package:ninjaid/bloc/movie_bloc.dart';
import 'package:ninjaid/bloc/movie_db.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/widgets/movie_gridveiw_widget.dart';

class SearchMovie extends StatefulWidget {
  final String movieName;

  const SearchMovie({Key key, this.movieName}) : super(key: key);

  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  MovieBloc _movieBloc;

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
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search a Movie',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Expanded(
                child: GridView.builder(
              itemCount: movieList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: 13 / 16,
              ),
              itemBuilder: (context, index) => MovieGridViewItem(
                movie: movieList[index],
              ),
            )

//              ListView.builder(
//                itemCount: movieList.length,
//                shrinkWrap: true,
//                itemBuilder: (context, index) => MovieListTile(
//                  movie: movieList[index],
//                ),
//              ),
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
