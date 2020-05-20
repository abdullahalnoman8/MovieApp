import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/utilities/movie_db.dart';

class MovieDetailPage extends StatefulWidget {
  final String imdbID;

  const MovieDetailPage({Key key, this.imdbID}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Movie movie;
  bool isLoaded = false;
  @override
  void initState() {
    print("Calling Parameter:  ${widget.imdbID}");
    // TODO: Write movie details into this widget then set loaded as true
    MovieDB().getMovieDetails(imdbID: widget.imdbID).then((value) {
      setState(() {
        movie = value;
//        print(movie);
        print("Movie Data: $movie");
        isLoaded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${movie?.title} Details '),
          backgroundColor: Colors.indigo[500],
          elevation: 0,
        ),
        body: Container(
          child: isLoaded
              ? Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        // Todo Image and few details of the movie will be shown here
                        children: <Widget>[
                          Expanded(child: Image.network(movie.poster)),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Title: ${movie.title}',
                                  ),
                                  Text('Year : ${movie.year}'),
                                  Text('Genre : ${movie.genre}'),
                                  Text('Writer: ${movie.writer}'),
                                  Text("Director: ${movie.director}"),
                                  Text("ImdbID: ${movie.imdbID}")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        // Todo Add the Description Of the Movie here
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Description: ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                                wordSpacing: 1.0),
                          ),
                          Text(
                            '${movie.plot}',
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        // TODO Add the review and other things into this block as footer of the page
                        children: <Widget>[
                          Text('Review: '),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.lightBlue,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.lightBlue,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.lightBlue,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.lightBlue,
                              ),
                            ],
                          ),
                          Text('Another Part'),
                        ],
                      )
                    ],
                  ),
                )
              : CircularProgressIndicator(
                  backgroundColor: Colors.amberAccent,
                ),
        )
        /*Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 24.0,
          child: isLoaded
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(child: Image.network(movie.poster)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 24.0,
                            shadows: [
                              Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 7.0,
                                  color: Colors.grey[600]),
                            ],
                          ),
                        ),
                        Text(
                          ' (${movie.year})',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 24.0),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              movie.director,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Text(
                            movie.plot,
                            textAlign: TextAlign.justify,
                          ),

                          // todo add the raging widget here
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.amberAccent,
                  ),
                ),
        ),
      ),*/
        );
  }
}
