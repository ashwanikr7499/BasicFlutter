import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/movie.dart';
import 'package:flutter_app/model/question.dart';

class MovieListView extends StatefulWidget {
  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  final List<Movie> movieList = Movie.getMovies();

  // final List movies = [
  //   "movie 1",
  //   "movie 2",
  //   "movie 3",
  //   "movie 4",
  //   "movie 5",
  //   "movie 6",
  //   "movie 7",
  //   "movie 8",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              movieCard(movieList[index], context),
              Positioned(top: 10, child: movieImage(movieList[index].imageUrl))
            ]);
            // return Card(
            //     elevation: 10,
            //     color: Colors.white,
            //     child: ListTile(
            //       leading: CircleAvatar(
            //         child: Container(
            //           width: 200,
            //           height: 200,
            //           decoration: BoxDecoration(
            //               // color: Colors.blue,
            //               image: DecorationImage(
            //                   image: NetworkImage(
            //                       movieList[i].imageUrl),
            //                   fit: BoxFit.cover),
            //               borderRadius: BorderRadius.circular(15)),
            //           child: Text("H"),
            //         ),
            //       ),
            //       trailing: Text("..."),
            //       title: Text(movieList[index].title),
            //       subtitle: Text("${movieList[index].year}"),
            //       onTap: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => MovieListViewDetails(
            //                       movieName: movieList[index].title,
            //                       movie: movieList[index],
            //                     )));
            //       },
            //       // onTap: () => debugPrint("${movies[index]}")),
            //     ));
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8.0, bottom: 8, left: 20, right: 20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                          child: Text(
                        "${movie.title}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      )),
                      Text(movie.year, style: mainTextStyle())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("rating: " + movie.rating, style: mainTextStyle()),
                      Flexible(
                          child: Text(
                        movie.imageUrl.substring(0, 20),
                        style: mainTextStyle(),
                        maxLines: 1,
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      movieName: movie.title,
                      movie: movie,
                    )))
      },
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(fontSize: 18, color: Colors.grey);
  }

  Widget movieImage(String imageurl) {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(imageurl), fit: BoxFit.cover)));
  }
}

class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Movies "),
      ),
      body: ListView(
        children: [
          MovieDetailsThumbnail(
            thumbnail: movie.imageUrl,
          ),
          MovieDetailsHeaderWithPoster(
            movie: movie,
          ),
          HorizontalLine(),
          MovieDetailsCast(
            movie: movie,
          ),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.otherImages,)
        ],
      ),
      // body: Center(
      //   child: Container(
      //     child: RaisedButton(
      //       child: Text("Go back $movieName, year is: ${movie.year}"),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment of childrens
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(thumbnail), fit: BoxFit.cover))),
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          height: 80,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          MoviePoster(poster: movie.imageUrl),
          SizedBox(
            width: 16,
          ),
          Expanded(child: MovieDetailsHeader(movie: movie))
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  @override
  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);

  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(poster), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie.year}. ${movie.rating}".toUpperCase(),
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.cyan),
        ),
        Text(
          movie.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
        Text.rich(TextSpan(
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            children: [
              TextSpan(text: movie.imageUrl.substring(0, 100)),
              TextSpan(text: "more...", style: TextStyle(color: Colors.indigo))
            ]))
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: [
          MovieField(field: "Cast", value: movie.imageUrl.substring(0, 150)),
          MovieField(
              field: "Directors", value: movie.imageUrl.substring(50, 100)),
          MovieField(field: "Awards", value: movie.imageUrl.substring(100, 150))
        ]));
  }
}

class MovieField extends StatelessWidget {
  final String field, value;

  const MovieField({Key key, this.field, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$field :",
            style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.w300)),
        Expanded(
          child: Text(value,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w300)),
        ),
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
  final List<String> posters;

  const MovieDetailsExtraPosters({Key key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "More Movie Posters".toUpperCase(),
          style: TextStyle(fontSize: 14, color: Colors.black26),
        ),
        Container(
          height: 200,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: posters.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 160,
                decoration: BoxDecoration(image: DecorationImage(image:NetworkImage(posters[index] ),fit: BoxFit.cover)),
              ),
            ),
          ),
        )
      ],
    );
  }
}

//----------- End of Movie App-----------

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question.name("Question 1", true),
    Question.name("Question 2", true),
    Question.name("Question 3", false),
    Question.name("Question 4", true),
    Question.name("Question 5", false),
    Question.name("Question 6", true),
    Question.name("Question 7", true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                "images/flag.png",
                width: 200,
                height: 200,
              )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid)),
                  height: 120,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () => _previousQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "True",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "False",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackBar = SnackBar(
        content: Text("Correct"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      Scaffold.of(context).showSnackBar(snackBar);
      debugPrint("Correct");
    } else {
      debugPrint("Incorrect");
      final snackBar = SnackBar(
        content: Text("Incorrect"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
    _nextQuestion();
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}

//Bill Splitter Application
class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.purpleAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total per person",
                      style: TextStyle(color: Colors.purple, fontSize: 25),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage).toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.pink.shade100.withOpacity(0.2),
                  border: Border.all(
                      color: Colors.blueGrey.shade200,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        prefixText: "Bill Amount\t",
                        prefixIcon: Icon(Icons.attach_money),
                      ),
                      onChanged: (String value) {
                        try {
                          _billAmount = double.parse(value);
                        } catch (exception) {
                          _billAmount = 0.0;
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split",
                          style: TextStyle(color: Colors.grey.shade400)),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter >= 1)
                                  _personCounter--;
                                else {}
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color:
                                      Colors.purple.shade200.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.purple.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                            ),
                          ),
                          Text(
                            "$_personCounter",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color:
                                      Colors.purple.shade200.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.purple.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tip",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "\$ ${calculateTotalTip(_billAmount, _personCounter, _tipPercentage).toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "$_tipPercentage%",
                        style: TextStyle(
                            color: Colors.purple.withOpacity(0.5),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          divisions: 10,
                          inactiveColor: Colors.grey,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              _tipPercentage = value.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    return (calculateTotalTip(billAmount, splitBy, tipPercentage) +
            billAmount) /
        splitBy;
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    if (billAmount < 0 || billAmount == null || billAmount.toString().isEmpty) {
    } else {
      return (billAmount * tipPercentage) / 100;
    }
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  List _quotes = [
    "1:skljdhgfls dlihgiosedj isdfhgisjgo; ipsdfugjpoisdugpos",
    "2:djhflishj ioldshgiosfhog",
    "3:jdhgkdjsghf kgkijgdj sdkilgjl dsoigjhioseaj riosghosirhg fspodgj sep jisur jigprjgsujrigbs aeoithjgupweujgpsedo kgksepgk ipsjgp oserjg jsepikgpskiegiksrpgkisohgrhjotijho erwljusgfioaeqho;wlujihoaerlioi;rwestgoiersiotgwepujirghujofdsudrurhgjriuol lidsgnbisjhiilnjprdjropsisjtop disofjgoieroajgoiaerjligwuguyasoufstoiw4ehrtiuouw3ortiudreytue4aiutheiuytiueryoitea4oi5yuersi5yu09ei4",
    "4:dsjkhgvkjdshgl"
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 200,
              width: 400,

              // color: Colors.orange---- CANT USE THIS WITH DECORATION,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.green, spreadRadius: 3),
                ],
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  _quotes[_index % _quotes.length],
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.pinkAccent.shade700),
                ),
              ))),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: FlatButton.icon(
              color: Colors.green,
              onPressed: _showQuote,
              icon: Icon(Icons.wb_sunny),
              label: Text(
                "Inspire me",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
          ),
          // Spacer()
        ],
      )),
    );
  }

  void _showQuote() {
    setState(() {
      _index++;
    });
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black45,
      body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[_getCard(), _getAvatar()],
          )),
    );
  }
}

Container _getAvatar() {
  return Container(
    width: 100,
    height: 100,
    margin: EdgeInsets.all(0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(100)),
      border: Border.all(color: Colors.black, width: 5),
      image: DecorationImage(
          image: NetworkImage("https://picsum.photos/id/1/200/300"),
          fit: BoxFit.cover),
    ),
  );
}

Container _getCard() {
  return Container(
    width: 350,
    height: 200,
    margin: EdgeInsets.all(50),
    decoration: BoxDecoration(
        color: Colors.pinkAccent, borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hello first text",
          style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
        ),
        Text("Second Text",
            style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person),
            Text("Name",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
          ],
        )
      ],
    ),
  );
}

alarmButton() {
  debugPrint("Clicked Alarm");
}

class ScaffoldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
                icon: Icon(Icons.email), onPressed: () => debugPrint("LOL")),
            IconButton(icon: Icon(Icons.access_alarm), onPressed: alarmButton),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: Icon(Icons.add_ic_call_rounded),
          onPressed: () => debugPrint("Clicked floating button"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_ic_call), title: Text("Call")),
            BottomNavigationBarItem(
                icon: Icon(Icons.email_rounded), title: Text("Email")),
            BottomNavigationBarItem(
                icon: Icon(Icons.alarm_outlined), title: Text("Alarm")),
          ],
          onTap: (index) {
            debugPrint("Clicked on index $index");
          },
        ),
        backgroundColor: Colors.amber.shade900,
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomButton()
                // InkWell(
                //   child: Text(
                //     "Click Me!",
                //     style: TextStyle(fontSize: 24),
                //   ),
                //   onTap: () => debugPrint("tapped Button"),
                // )
              ],
            )));
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final snackBar = SnackBar(
            content: Text("Hello Again2"),
            backgroundColor: Colors.green,
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8.0)),
            child: Text("Button")));
  }
}

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         color: Colors.red,
//         shadowColor: Colors.blue,
//         child: Center(
//           child: Text(
//             "Hello Flutter",
//             textDirection: TextDirection.ltr,
//             style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 25.5,
//                 fontStyle: FontStyle.italic),
//           ),
//         ));
//   }
// }
