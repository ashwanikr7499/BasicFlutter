class Movie {
  static List<Movie> getMovies() => [
        Movie("Movie 1", "1991"),
        Movie("Movie 2", "1992"),
        Movie("Movie 3", "1993"),
        Movie("Movie 4", "1994"),
      ];

  String title;
  String year;

  Movie(this.title, this.year);
}
