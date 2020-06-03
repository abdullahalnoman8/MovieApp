import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/utilities/movie_data_storage.dart';
import 'package:ninjaid/utilities/movie_db.dart';

class MovieDetailPage extends StatefulWidget {
  final String imdbID;

  MovieDetailPage({Key key, this.imdbID}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Movie movie;
  bool isLoaded = false;

  _toggleFavouriteMovie() {
    setState(() {
      print("## Add Movie $movie ");
      if (movie != null) {
        MovieDataStorage.of(context).toggleMovie(movie);
      }
    });
  }

  @override
  void didChangeDependencies() {
    MovieDB()
        .getMovieDetails(imdbID: widget.imdbID, context: context)
        .then((value) {
      setState(() {
        movie = value;
//        print("Movie Data: $movie");
        isLoaded = true;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
//    final container = MovieDataStorage.of(context);
//    print('Container: {$container}');

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
              end: Alignment(
                  0.8, 0.0), // 10% of the width, so there are ten blinds.
              colors: [
                const Color(0xFFFFFFEE),
                const Color(0xFF999999)
              ], // whitish to gray
              tileMode: TileMode.clamp, // repeats the gradient over the canvas
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
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
//                                Expanded(child: Image.network(movie.poster)),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          '${movie.title}',
                                          style: TextStyle(
                                              fontSize: 24.0,
                                              shadows: [
                                                Shadow(
                                                    offset: Offset(2, 2),
                                                    blurRadius: 7,
                                                    color: Colors.grey[700])
                                              ]),
                                        ),
                                        Text(
                                          '${movie.year}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 24.0),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: "Genre:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: " ${movie.genre}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: "Writer:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: " ${movie.writer}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Released: ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
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
                                                fontWeight: FontWeight.w700,
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
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(' ${movie.country}'),
                                          ],
                                        ),
                                        RichText(
                                          text: TextSpan(
                                              text: "Awards:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: " ${movie.awards}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal)),
                                              ]),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Runtime:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(' ${movie.runTime}'),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              "Director:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(" ${movie.director}"),
                                          ],
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: "Actors:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: " ${movie.actors}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                            // TODO Add the review and other things into this block as footer of the page
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
                                child: Icon(MovieDataStorage.of(context)
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
        ));
  }
}
