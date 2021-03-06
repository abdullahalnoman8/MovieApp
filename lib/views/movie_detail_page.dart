import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninjaid/bloc/movie_detail_bloc.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/networking/api_response.dart';
import 'package:ninjaid/widgets/api_response_error_widget.dart';
import 'package:ninjaid/widgets/loading_widget.dart';

class MovieDetailPage extends StatefulWidget {
  final String imdbID;

  MovieDetailPage({Key key, this.imdbID}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Movie movie;
  bool isLoaded = false;
  MovieDetailBloc _movieDetailBloc = new MovieDetailBloc();

  _toggleFavouriteMovie() {
    setState(() {
      print("## Add Movie $movie ");
      if (movie != null) {
        _movieDetailBloc.toggleMovie(movie);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _movieDetailBloc.fetchMovieDetail(widget.imdbID);
    super.initState();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse<Movie>>(
      stream: _movieDetailBloc.movieDetailStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data.status) {
            case Status.LOADING:
              return LoadingWidget(loadingMessage: snapshot.data.message);
              break;
            case Status.COMPLETED:
              movie = snapshot.data.data;
              if (movie != null) {
                isLoaded = true;
              }
              return Scaffold(
                appBar: AppBar(
                  title: Text('${movie?.title} Details '),
                  backgroundColor: Colors.indigo[500],
                  elevation: 0,
                ),
                body: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8,
                          0.0), // 10% of the width, so there are ten blinds.
                      colors: [
                        const Color(0xFFFFFFEE),
                        const Color(0xFF999999)
                      ], // whitish to gray
                      tileMode: TileMode
                          .clamp, // repeats the gradient over the canvas
                    ),
                  ),
                  child: isLoaded
                      ? Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Expanded(
                                  flex: 3,
                                  child: IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Hero(
                                                      child: Image.network(
                                                        movie.poster,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      tag: movie.imdbID,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  '${movie.title}',
                                                  style: TextStyle(
                                                      fontSize: 24.0,
                                                      shadows: [
                                                        Shadow(
                                                            offset:
                                                                Offset(2, 2),
                                                            blurRadius: 7,
                                                            color: Colors
                                                                .grey[700])
                                                      ]),
                                                ),
                                                Text(
                                                  '${movie.year}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 24.0),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: "Genre:",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: " ${movie.genre}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: "Writer:",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text:
                                                            " ${movie.writer}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      'Released: ',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text('${movie.released}'),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      'Language:',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(' ${movie.language}'),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      'Country:',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(' ${movie.country}'),
                                                  ],
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: "Awards:",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text:
                                                            " ${movie.awards}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      'Runtime:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Text(' ${movie.runTime}'),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "Director:",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(" ${movie.director}"),
                                                  ],
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: "Actors:",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text:
                                                            " ${movie.actors}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Description: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0,
                                            wordSpacing: 1.0),
                                      ),
                                      SizedBox(
                                        height: 10,
                                        width: 0,
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Text(
                                            '${movie.plot}',
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      for (var rating in movie.ratings)
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Text(" ${rating.source}"),
                                              Text("Value: ${rating.value}"),
                                            ],
                                          ),
                                        ),
                                      RaisedButton(
                                        onPressed: _toggleFavouriteMovie,
                                        child: Icon(_movieDetailBloc
                                                .containsMovie(movie)
                                            ? Icons.favorite
                                            : Icons.favorite_border),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.amberAccent,
                          ),
                        ),
                ),
              );
              break;
            case Status.ERROR:
              return ApiResponseErrorWidget(
                errorMessage: snapshot.data.message,
                onRetryPressed: () =>
                    _movieDetailBloc.fetchMovieDetail(widget.imdbID),
              );
              break;
          }
        }
        return Container();
      },
    );
  }
}

//class MovieDetailWidget extends StatefulWidget {
//  final Movie movie;
//
//  const MovieDetailWidget({Key key, this.movie}) : super(key: key);
//  @override
//  _MovieDetailWidgetState createState() => _MovieDetailWidgetState();
//}
//
//class _MovieDetailWidgetState extends State<MovieDetailWidget> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//    );
//  }
//}
