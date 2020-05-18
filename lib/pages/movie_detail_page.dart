import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/utilities/movie_db.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailPage(this.movie, {Key key}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Movie movie = null;
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: Write movie details into this widget then set loaded as true
    MovieDB().getMovieDetails(imdbID: "", name: "").then((value) {
      setState(() {
        movie = value;
        isLoaded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? Scaffold(
            appBar: AppBar(
              title: Text('${widget.movie.title} Details '),
              backgroundColor: Colors.indigo[500],
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 24.0,
                child: Column(
//          mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(widget.movie.poster),
                    Row(
//              mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.movie.title,
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
                          ' (${widget.movie.year})',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 24.0),
                        ),
                      ],
                    ),
//            Text(movie.name),
//            Text('${movie.year}'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              widget.movie.director,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Text(
                            widget.movie.description,
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : CircularProgressIndicator(
            // todo update with the property
            );
  }
}
