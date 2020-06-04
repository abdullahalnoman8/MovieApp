import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninjaid/repository/movie_data_storage.dart';
import 'package:ninjaid/views/search_movies.dart';
import 'package:ninjaid/widgets/movie_details_card.dart';

void main() {
  print("App Installed");
  /*runApp(MaterialApp(
      home: NinjaCard()
  ));*/
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MovieDataStorage(
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Movie App'),
          backgroundColor: Colors.indigo[500],
          elevation: 0.0,
          centerTitle: false,
        ),
        body: new ListView.separated(
          itemCount: MovieDataStorage.of(context).movies.length,
          itemBuilder: (context, index) => MovieDetailsCard(
            movie: MovieDataStorage.of(context).movies[index],
          ),
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 1.0,
              indent: 0,
              endIndent: 0,
              color: ((index + 1) % 2) == 0
                  ? Colors.grey[350]
                  : Colors.amberAccent[350],
              height: 6,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SearchMovie()),
          ),
          child: Icon(
            Icons.search,
          ),
        ),
      );
}
