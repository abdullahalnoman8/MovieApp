import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/repository/movie_data_storage.dart';
import 'package:ninjaid/views/movie_detail_page.dart';

class MovieGridViewItem extends StatelessWidget {
  final Movie movie;

  const MovieGridViewItem({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            movie.poster,
            fit: BoxFit.fill,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context) => MovieDetailPage(
                            imdbID: movie.imdbID,
                          )))
                  .then((value) => MovieDataStorage.of(context).setState(
                        () {},
                      ));
            },
          ),
          Positioned(
            bottom: 25,
            child: Container(
              width: MediaQuery.of(context).size.width / 2 - 17,
              height: 30,
              color: Color.fromRGBO(255, 255, 255, 0.7),
              child: Center(
                child: Text(
                  movie.title + ' (' + movie.year + ')',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
