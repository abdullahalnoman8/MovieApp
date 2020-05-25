import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: 'Title')
  final String title;
  @JsonKey(name: 'Year')
  final String year;
  @JsonKey(name: 'Rated')
  final String rated;
  @JsonKey(name: 'imdbID')
  final String imdbID;
  @JsonKey(name: 'Director')
  final String director;

  @JsonKey(name: 'Poster')
  final String poster;
  @JsonKey(name: 'Released')
  final String released;
  @JsonKey(name: 'Runtime')
  final String runTime;
  @JsonKey(name: 'Genre')
  final String genre;
  @JsonKey(name: 'Writer')
  final String writer;
  @JsonKey(name: 'Actors')
  final String actors;
  @JsonKey(name: 'Plot')
  final String plot;
  @JsonKey(name: 'Language')
  final String language;
  @JsonKey(name: 'Country')
  final String country;
  @JsonKey(name: 'Awards')
  final String awards;
  @JsonKey(name: 'Ratings')
  final List<Rating> ratings;
  @JsonKey(name: 'Metascore')
  final String metaCore;
  @JsonKey(name: 'imdbRating')
  final String imdbRating;
  @JsonKey(name: 'imdbVotes')
  final String imdbVotes;
  @JsonKey(name: 'Type')
  final String type;
  @JsonKey(name: 'DVD')
  final String dvd;
  @JsonKey(name: 'BoxOffice')
  final String boxOffice;
  @JsonKey(name: 'Production')
  final String production;
  @JsonKey(name: 'Website')
  final String website;
  @JsonKey(name: 'Response')
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

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  String toString() {
    return 'Movie{title: $title, year: $year, rated: $rated, imdbID: $imdbID, '
        'director: $director, poster: $poster, released: $released, runTime: $runTime,'
        ' genre: $genre, writer: $writer, actors: $actors, plot: $plot, '
        'language: $language, country: $country, awards: $awards, ratings: $ratings,'
        ' metaCore: $metaCore, imdbRating: $imdbRating, imdbVotes: $imdbVotes, '
        'type: $type, dvd: $dvd, boxOffice: $boxOffice, production: $production, '
        'website: $website, response: $response}';
  }
}

@JsonSerializable()
class Rating {
  @JsonKey(name: 'Source')
  final String source;
  @JsonKey(name: 'Value')
  final String value;

  Rating(this.source, this.value);

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  Map<String, dynamic> toJson() => _$RatingToJson(this);

  @override
  String toString() {
    return 'Rating{source: $source, value: $value}';
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
