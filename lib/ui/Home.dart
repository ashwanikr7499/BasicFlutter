import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex=0;
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
      body:Builder(
        builder:(BuildContext context)=> Container(
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
                    onPressed: () => _checkAnswer(true,context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "True",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false,context),
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
      _currentQuestionIndex=(_currentQuestionIndex+1)%questionBank.length;
    });

  }
  _checkAnswer(bool userChoice,BuildContext context) {
    if(userChoice==questionBank[_currentQuestionIndex].isCorrect )
      {
        final snackBar=SnackBar(content: Text("Correct"),duration: Duration(milliseconds: 500),backgroundColor: Colors.green,);
        Scaffold.of(context).showSnackBar(snackBar);
        debugPrint("Correct");
      }
    else
      {
        debugPrint("Incorrect");
        final snackBar=SnackBar(content: Text("Incorrect"),duration: Duration(milliseconds: 500),backgroundColor:Colors.red ,);
        Scaffold.of(context).showSnackBar(snackBar);
      }
    _nextQuestion();

  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex=(_currentQuestionIndex-1)%questionBank.length;
    });
  }
}


//CTRL + .
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
