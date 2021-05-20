class Movie {
  static List<Movie> getMovies() => [
        Movie("Movie 1", "1991", "9.1"),
        Movie("Movie 2", "1992", "9.2"),
        Movie("Movie 3", "1993", "9.3"),
        Movie("Movie 4", "1994", "9.4"),
        Movie("Movie 5", "1995", "9.5"),
        Movie("Movie 6", "1996", "9.6"),
      ];

  String title;
  String year;
  String rating;
  String imageUrl;
  List<String> otherImages = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHAXxoeeZyEL-QE42cxmoZobBLZbdkjCp-EQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThVMVjWymZJ6fg3oMW1eYNlsT5V6nJ_FEQlQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMuOCmCV4x1qm9xwcApwvmeKjt2B03q9Unvw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIpVZbX6-uDBuu-koqzll_hBbr8KFVQl1kiw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnvrHEBtholwSPPaXX56Mx3c1CFsP_PLn6FA&usqp=CAU",
    "https://lostinanime.com/wp-content/uploads/2013/07/Hunter2520X2520Hunter2520-2520902520-2520Large252001_thumb.jpg"
  ];

  Movie(this.title, this.year, this.rating,
      [this.imageUrl =
          'https://images-eu.ssl-images-amazon.com/images/I/51oTNvUoyaL.__AC_SY300_SX300_QL70_ML2_.jpg']);
}
