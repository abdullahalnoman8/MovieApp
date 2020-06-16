import 'package:flutter/material.dart';
import 'package:ninjaid/bloc/movie_bloc.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/networking/api_response.dart';
import 'package:ninjaid/widgets/api_response_error_widget.dart';
import 'package:ninjaid/widgets/loading_widget.dart';
import 'package:ninjaid/widgets/movie_gridveiw_widget.dart';

class SearchMovie extends StatefulWidget {
  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  MovieBloc _movieBloc;

  TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = new TextEditingController();
    textEditingController.addListener(searchMovies);
    _movieBloc = MovieBloc();
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
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: RefreshIndicator(
                child: StreamBuilder<ApiResponse<List<Movie>>>(
                  stream: _movieBloc.movieListStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      switch (snapshot.data.status) {
                        case Status.LOADING:
                          return LoadingWidget(
                              loadingMessage: snapshot.data.message);
                          break;
                        case Status.COMPLETED:
                          return MovieList(
                            movieList: snapshot.data.data,
                          );
                          break;
                        case Status.ERROR:
                          return ApiResponseErrorWidget(
                            errorMessage: snapshot.data.message,
                            onRetryPressed: () => _movieBloc
                                .searchMovies(textEditingController.value.text),
                          );
                          break;
                      }
                    }
                    return Container();
                  },
                ),
                onRefresh: () {
                  return _movieBloc
                      .searchMovies(textEditingController.value.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  searchMovies() {
    _movieBloc.searchMovies(textEditingController.value.text);
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movieList;

  const MovieList({Key key, this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.7),
      itemBuilder: (context, index) {
        return MovieGridViewItem(
          movie: movieList[index],
        );
      },
      shrinkWrap: true,
    );
  }
}
