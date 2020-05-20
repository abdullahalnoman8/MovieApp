import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String imdbID;
  final String year;
  final String director;
  final String poster;

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

  Movie({
    @required this.poster,
    @required this.imdbID,
    @required this.title,
    @required this.year,
    @required this.type,
    this.rated,
    this.released,
    this.runTime,
    this.genre,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.ratings,
    this.metaCore,
    this.imdbRating,
    this.imdbVotes,
    this.dvd,
    this.boxOffice,
    this.production,
    this.website,
    this.response,
    this.director,
  });

  String get id => imdbID;

  factory Movie.fromJson(dynamic json) {
    return Movie(
      imdbID: json['imdbID'] as String,
      actors: json['Actors'] as String,
      awards: json['Awards'] as String,
      boxOffice: json['BoxOffice'] as String,
      country: json['Bountry'] as String,
      dvd: json['DVD'] as String,
      genre: json['Denre'] as String,
      language: json['Language'] as String,
      plot: json['Plot'] as String,
      production: json['Production'] as String,
      imdbRating: json['imdbRating'] as String,
      released: json['Released'] as String,
      rated: json['Rated'] as String,
      metaCore: json['MetaCore'] as String,
      poster: json['Poster'] as String,
      response: json['Response'] as String,
      director: json['Director'] as String,
      imdbVotes: json['imdbVotes'] as String,
      runTime: json['RunTime'] as String,
      title: json['Title'] as String,
      type: json['Type'] as String,
      website: json['Website'] as String,
      writer: json['Writer'] as String,
      year: json['Year'] as String,
      ratings: json['Ratings'] != null
          ? <Rating>[
              for (var rating in json['Ratings'] as List)
                Rating.fromJson(rating),
            ]
          : List<Rating>(),
    );
  }

  @override
  String toString() {
    return 'Movie{title: $title, imdbID: $imdbID, year: $year, director: $director, '
        'poster: $poster, rated: $rated, released: $released, runTime: $runTime, '
        'genre: $genre, writer: $writer, actors: $actors, plot: $plot, language: $language,'
        ' country: $country, awards: $awards, ratings: $ratings, metaCore: $metaCore,'
        ' imdbRating: $imdbRating, imdbVotes: $imdbVotes, type: $type, dvd: $dvd,'
        ' boxOffice: $boxOffice, production: $production, website: $website, response: $response}';
  }
}

class Rating {
  final String source;

  final String value;

  Rating(this.source, this.value);
  factory Rating.fromJson(dynamic json) {
    return Rating(json['Source'] as String, json['Value'] as String);
  }
}

Movie topGun = Movie(
    imdbID: "tt0092099",
    type: "movie",
    title: "Top Gun",
    year: "1986",
    director: "Tony Scott",
    plot:
        "As students at the United States Navy's elite fighter weapons school compete "
        "to be best in the class, one daring young pilot learns a few things from a"
        " civilian instructor that are not taught in the classroom.",
    poster:
        "https://m.media-amazon.com/images/M/MV5BZjQxYTA3ODItNzgxMy00N2Y2LWJlZGMtMTRlM2JkZjI1ZDhhXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_SY1000_CR0,0,646,1000_AL_.jpg");

Movie aBeautifulMind = Movie(
    imdbID: "tt0268978",
    type: "movie",
    title: "A Beautiful Mind",
    year: "2001",
    director: "John Howard",
    plot:
        "After John Nash, a brilliant but asocial mathematician, accepts secret work"
        " in cryptography, his life takes a turn for the nightmarish.",
    poster:
        "https://m.media-amazon.com/images/M/MV5BMzcwYWFkYzktZjAzNC00OGY1LWI4YTgtNzc5"
        "MzVjMDVmNjY0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SY1000_CR0,0,673,1000_AL_.jpg");

Movie theImitationGame = Movie(
    imdbID: "tt2084970",
    type: "movie",
    title: "The Imitation Game",
    year: "2014",
    director: "Morten Tyldum",
    plot:
        "During World War II, the English mathematical genius Alan Turing tries to "
        "crack the German Enigma code with help from fellow mathematicians.",
    poster:
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
