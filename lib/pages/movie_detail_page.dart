import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninjaid/model/movie.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${movie.title} Details '),
        backgroundColor: Colors.indigo[500],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 24.0,
          child: Column(
//          mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(movie.imageUrl),
              Row(
//              mainAxisSize: MainAxisSize.max,
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
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0),
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
                        movie.director,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Text(
                      movie.description,
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
