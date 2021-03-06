import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ninjaid/model/movie.dart';
import 'package:ninjaid/views/movie_detail_page.dart';

class MovieGridViewItem extends StatelessWidget {
  final Movie movie;

  const MovieGridViewItem({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MovieDetailPage(
                  imdbID: movie.imdbID,
                )));
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.expand,
        children: [
          Image.network(
            movie.poster,
            fit: BoxFit.contain,
          ),
          Positioned(
            bottom: 25,
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              color: Color.fromRGBO(255, 255, 255, 0.7),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    movie.title + ' (' + movie.year + ')',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
