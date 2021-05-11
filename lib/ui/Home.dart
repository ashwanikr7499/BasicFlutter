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
      backgroundColor: Colors.blueGrey,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                elevation: 10,
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          // color: Colors.blue,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "data:image/jpeg;base64,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"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text("H"),
                    ),
                  ),
                  trailing: Text("..."),
                  title: Text(movieList[index].title),
                  subtitle: Text("${movieList[index].year}"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieListViewDetails(
                                  movieName: movieList[index].title,
                                  movie: movieList[index],
                                )));
                  },
                  // onTap: () => debugPrint("${movies[index]}")),
                ));
          }),
    );
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
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Go back $movieName, year is: ${movie.year}"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

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
