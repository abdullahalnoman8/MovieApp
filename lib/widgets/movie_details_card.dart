import 'package:flutter/material.dart';
import 'package:ninjaid/model/movie.dart';

class MovieDetailsCard extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCard({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          SizedBox(
            height: 250.0,
            child: Image.network(
              movie.poster,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                }
              },
            ),
          ),
          Column(
            children: [
              RichText(
                text: TextSpan(
                  text: "Title:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: movie.title,
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
