class Movie {
  final String name;
  final int _id;
  final int year;
  final String director;
  final String description;
  final String imageUrl;
  static int idCounter = 1;
  Movie(this.name, this.year, this.director, this.description, this.imageUrl)
      : _id = idCounter {
    idCounter++;
  }

  int get id => _id;
}

Movie topGun = Movie(
    "Top Gun",
    1986,
    "Tony Scott",
    "As students at the United States Navy's elite fighter weapons school compete "
        "to be best in the class, one daring young pilot learns a few things from a"
        " civilian instructor that are not taught in the classroom.",
    "https://m.media-amazon.com/images/M/MV5BZjQxYTA3ODItNzgxMy00N2Y2LWJlZGMtMTR"
        "lM2JkZjI1ZDhhXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_SY1000_CR0,0,646,1000_AL_.jpg");
Movie aBeautifulMind = Movie(
    "A Beautiful Mind",
    2001,
    "Ron Howard",
    "After John Nash, a brilliant but asocial mathematician, accepts secret work"
        " in cryptography, his life takes a turn for the nightmarish.",
    "https://m.media-amazon.com/images/M/MV5BMzcwYWFkYzktZjAzNC00OGY1LWI4YTgtNzc5"
        "MzVjMDVmNjY0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SY1000_CR0,0,673,1000_AL_.jpg");
Movie theImitationGame = Movie(
    "The Imitation Game",
    2014,
    "Morten Tyldum",
    "During World War II, the English mathematical genius Alan Turing tries to "
        "crack the German Enigma code with help from fellow mathematicians.",
    "https://m.media-amazon.com/images/M/MV5BOTgwMzFiMWYtZDhlNS00ODNkLWJiODAtZDV"
        "hNzgyNzJhYjQ4L2ltYWdlXkEyXkFqcGdeQXVyNzEzOTYxNTQ@._V1_SY999_CR0,0,670,999_AL_.jpg");
