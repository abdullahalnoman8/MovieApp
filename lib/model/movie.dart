import 'package:flutter/material.dart';

class Movie {
  final String title;
  final int _imdbId;
  final int year;
  final String director;
  final String description;
  final String imageUrl;
  static int idCounter = 1;

  final String rated;
  final String released;
  final String runTime;
  final String genre;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final List<Rating> ratings;
  final String metaCore;
  final String imdbRating;
  final String imdbVotes;
  final String type;
  final String dvd;
  final String boxOffice;
  final String production;
  final String website;
  final String response;

  //TODO Not all parameters should be required.

  Movie(
      {@required this.rated,
      @required this.released,
      @required this.runTime,
      @required this.genre,
      @required this.writer,
      @required this.actors,
      @required this.plot,
      @required this.language,
      @required this.country,
      @required this.awards,
      @required this.ratings,
      @required this.metaCore,
      @required this.imdbRating,
      @required this.imdbVotes,
      @required this.type,
      @required this.dvd,
      @required this.boxOffice,
      @required this.production,
      @required this.website,
      @required this.response,
      @required this.title,
      @required this.year,
      @required this.director,
      @required this.description,
      @required this.imageUrl})
      : _imdbId = idCounter {
    idCounter++;
  }

  int get id => _imdbId;

  factory Movie.fromJson(dynamic json) {
    //TODO Deserialize the Ratings
    return Movie(
      actors: json['actors'] as String,
      awards: json['awards'] as String,
      boxOffice: json['boxOffice'] as String,
      country: json['country'] as String,
      dvd: json['dvd'] as String,
      genre: json['genre'] as String,
      language: json['language'] as String,
      plot: json['plot'] as String,
      production: json['production'] as String,
      imdbRating: json['imdbRating'] as String,
      released: json['released'] as String,
      rated: json['rated'] as String,
      metaCore: json['metaCore'] as String,
      //TODO This field is not called "imageUrl" inside the JSON
      imageUrl: json['imageUrl'] as String,
      response: json['response'] as String,
      director: json['director'] as String,
      imdbVotes: json['imdbVotes'] as String,
      runTime: json['runTime'] as String,
      description: json['description'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      website: json['website'] as String,
      writer: json['writer'] as String,
      year: json['year'] as int,
    );
  }

  @override
  String toString() {
    return 'Movie{title: $title, _imdbId: $_imdbId, year: $year, director: $director,'
        ' description: $description, imageUrl: $imageUrl, rated: $rated, released: $released,'
        ' runTime: $runTime, genre: $genre, writer: $writer, actors: $actors, plot: $plot, '
        'language: $language, country: $country, awards: $awards, ratings: $ratings, '
        'metaCore: $metaCore, imdbRating: $imdbRating, imdbVotes: $imdbVotes, type: $type,'
        ' dvd: $dvd, boxOffice: $boxOffice, production: $production, website: $website, response: $response}';
  }
}

class Rating {
  final String source;
  final String value;

  Rating(this.source, this.value);
  //TODO Add a way to deserialize Ratings
}

Movie topGun = Movie(
    rated: null,
    released: null,
    runTime: null,
    genre: null,
    writer: null,
    actors: null,
    plot: null,
    language: null,
    country: null,
    awards: null,
    ratings: null,
    metaCore: null,
    imdbRating: null,
    imdbVotes: null,
    type: null,
    dvd: null,
    boxOffice: null,
    production: null,
    website: null,
    response: null,
    title: "Top Gun",
    year: 1986,
    director: "Tony Scott",
    description:
        "As students at the United States Navy's elite fighter weapons school compete "
        "to be best in the class, one daring young pilot learns a few things from a"
        " civilian instructor that are not taught in the classroom.",
    imageUrl:
        "https://m.media-amazon.com/images/M/MV5BZjQxYTA3ODItNzgxMy00N2Y2LWJlZGMtMTRlM2JkZjI1ZDhhXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_SY1000_CR0,0,646,1000_AL_.jpg");

Movie aBeautifulMind = Movie(
    rated: null,
    released: null,
    runTime: null,
    genre: null,
    writer: null,
    actors: null,
    plot: null,
    language: null,
    country: null,
    awards: null,
    ratings: null,
    metaCore: null,
    imdbRating: null,
    imdbVotes: null,
    type: null,
    dvd: null,
    boxOffice: null,
    production: null,
    website: null,
    response: null,
    title: "A Beautiful Mind",
    year: 2001,
    director: "John Howard",
    description:
        "After John Nash, a brilliant but asocial mathematician, accepts secret work"
        " in cryptography, his life takes a turn for the nightmarish.",
    imageUrl:
        "https://m.media-amazon.com/images/M/MV5BMzcwYWFkYzktZjAzNC00OGY1LWI4YTgtNzc5"
        "MzVjMDVmNjY0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SY1000_CR0,0,673,1000_AL_.jpg");

Movie theImitationGame = Movie(
    rated: null,
    released: null,
    runTime: null,
    genre: null,
    writer: null,
    actors: null,
    plot: null,
    language: null,
    country: null,
    awards: null,
    ratings: null,
    metaCore: null,
    imdbRating: null,
    imdbVotes: null,
    type: null,
    dvd: null,
    boxOffice: null,
    production: null,
    website: null,
    response: null,
    title: "The Imitation Game",
    year: 2014,
    director: "Morten Tyldum",
    description:
        "During World War II, the English mathematical genius Alan Turing tries to "
        "crack the German Enigma code with help from fellow mathematicians.",
    imageUrl:
        "https://m.media-amazon.com/images/M/MV5BOTgwMzFiMWYtZDhlNS00ODNkLWJiODAtZDV"
        "hNzgyNzJhYjQ4L2ltYWdlXkEyXkFqcGdeQXVyNzEzOTYxNTQ@._V1_SY999_CR0,0,670,999_AL_.jpg");

//Movie topGun = Movie(
//    "Top Gun",
//    1986,
//    "Tony Scott",
//    "As students at the United States Navy's elite fighter weapons school compete "
//        "to be best in the class, one daring young pilot learns a few things from a"
//        " civilian instructor that are not taught in the classroom.",
//    "https://m.media-amazon.com/images/M/MV5BZjQxYTA3ODItNzgxMy00N2Y2LWJlZGMtMTR"
//        "lM2JkZjI1ZDhhXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_SY1000_CR0,0,646,1000_AL_.jpg");
//Movie aBeautifulMind = Movie(
//    "A Beautiful Mind",
//    2001,
//    "Ron Howard",
//    "After John Nash, a brilliant but asocial mathematician, accepts secret work"
//        " in cryptography, his life takes a turn for the nightmarish.",
//    "https://m.media-amazon.com/images/M/MV5BMzcwYWFkYzktZjAzNC00OGY1LWI4YTgtNzc5"
//        "MzVjMDVmNjY0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SY1000_CR0,0,673,1000_AL_.jpg");
//Movie theImitationGame = Movie(
//    "The Imitation Game",
//    2014,
//    "Morten Tyldum",
//    "During World War II, the English mathematical genius Alan Turing tries to "
//        "crack the German Enigma code with help from fellow mathematicians.",
//    "https://m.media-amazon.com/images/M/MV5BOTgwMzFiMWYtZDhlNS00ODNkLWJiODAtZDV"
//        "hNzgyNzJhYjQ4L2ltYWdlXkEyXkFqcGdeQXVyNzEzOTYxNTQ@._V1_SY999_CR0,0,670,999_AL_.jpg");
