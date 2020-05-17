import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

final QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  void addCorrectAnswer() {
    scoreKeeper.add(
      Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    resetScoreKeeper();
  }

  void addIncorrectAnswer() {
    scoreKeeper.add(
      Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
  }

  void evaluateAnswer(bool answer) {
    setState(() {
      if (answer == quizBrain.evaluateAnswer(answer)) {
        addCorrectAnswer();
      } else {
        addIncorrectAnswer();
      }
      quizBrain.nextQuestion();
    });

    if (quizBrain.hasReachedEndOfQuiz()) {
      Alert(
        context: context,
        type: AlertType.info,
        title: "Quizz",
        desc: "You've reached the end of the quiz. Click ok to restart it",
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                quizBrain.resetQuiz();
                resetScoreKeeper();
              });
              Navigator.pop(context);
            },
            width: 120,
          )
        ],
      ).show();
    }
  }

  void resetScoreKeeper() {
    scoreKeeper.clear();
    scoreKeeper.add(
      SizedBox(
        width: 0,
        height: 24.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getCurrentQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                evaluateAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                evaluateAnswer(false);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}
