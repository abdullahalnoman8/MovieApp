class Movie {
  final String name;
  final int _id;
  final int year;
  final String director;
  final String description;
  static int idCounter = 1;
  Movie(this.name, this.year, this.director, this.description)
      : _id = idCounter {
    idCounter++;
  }

  int get id => _id;
}

Movie topGun = Movie("TopGun", 1986, "Tony Scott",
    " As students at the United States Navy's elite fighter weapons school compete to be best in the class, one daring young pilot learns a few things from a civilian instructor that are not taught in the classroom.");
Movie aBeautifulMind = Movie("A Beautiful Mind", 2001, "Ron Howard",
    "After John Nash, a brilliant but asocial mathematician, accepts secret work in cryptography, his life takes a turn for the nightmarish.");
Movie theImitationGame = Movie("The Imitation Game", 2014, "Morten Tyldum",
    "During World War II, the English mathematical genius Alan Turing tries to crack the German Enigma code with help from fellow mathematicians.");
