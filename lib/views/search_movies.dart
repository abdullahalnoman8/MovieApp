import 'package:flutter/material.dart';
import 'package:ninjaid/bloc/movie_bloc.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/networking/api_response.dart';
import 'package:ninjaid/widgets/movie_gridveiw_widget.dart';

class SearchMovie extends StatefulWidget {
  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  MovieBloc _movieBloc;

  TextEditingController textEditingController;
  List<Movie> movieList = [];
  Function onSearch;

  @override
  void initState() {
    super.initState();
    textEditingController = new TextEditingController();
    textEditingController.addListener(onSearch);
    _movieBloc = MovieBloc(textEditingController.value.text);
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

            RefreshIndicator(
              child: StreamBuilder<ApiResponse<List<Movie>>>(
                stream: _movieBloc.movieListStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data.status) {
                      case Status.LOADING:
                        return Loading(loadingMessage: snapshot.data.message);
                        break;
                      case Status.COMPLETED:
                        movieList = snapshot.data.data;
                        if (movieList.isEmpty) {
                          return Container();
                        } else {
                          onSearch = _movieBloc
                              .searchMovies(textEditingController.value.text);
                          print('On Search: ' + onSearch.toString() + '');
                          return searchMovies();
                        }
                        break;
                      case Status.ERROR:
                        return Error(
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
//            Expanded(
//              child: GridView.builder(
//                itemCount: movieList.length,
//                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                    crossAxisCount: 2,
//                    crossAxisSpacing: 2.0,
//                    mainAxisSpacing: 2.0,
//                    childAspectRatio: 12 / 19),
//                itemBuilder: (context, index) {
//                  return MovieGridViewItem(
//                    movie: movieList[index],
//                  );
//                },
//              ),
//            ),
          ],
        ),
      ),
    );
  }

//  searchMovies() {
//    MovieDB().searchMovies(textEditingController.value.text).then((value) {
//      if (this.mounted)
//        setState(() {
//          movieList = value;
//        });
//    });
//    _movieBloc.searchMovies(textEditingController.value.text);
//  }

  searchMovies() {
    GestureDetector(
      onTap: () {
        print(' Searching With : ' + textEditingController.value.text);
        onSearch = _movieBloc.searchMovies(textEditingController.value.text);
      },
      child: MovieList(
        movieList: movieList,
        onTextType: _movieBloc.searchMovies(textEditingController.value.text),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movieList;
  final Function onTextType;

  const MovieList({Key key, this.movieList, this.onTextType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: movieList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            childAspectRatio: 12 / 19),
        itemBuilder: (context, index) {
          return MovieGridViewItem(
            movie: movieList[index],
          );
        },
        shrinkWrap: true,
      ),
    );
  }
}

class Error extends StatelessWidget {
  final String errorMessage;

  final Function onRetryPressed;

  const Error({Key key, this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          RaisedButton(
            color: Colors.redAccent,
            child: Text(
              'Retry',
              style: TextStyle(
//                color: Colors.white,
                  ),
            ),
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}

class Loading extends StatelessWidget {
  final String loadingMessage;

  const Loading({Key key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
//              color: Colors.lightGreen,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 24),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
          ),
        ],
      ),
    );
  }
}
