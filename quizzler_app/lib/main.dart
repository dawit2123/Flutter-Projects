import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Roboto'),
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey.shade900,
            body: SafeArea(
              child: QuizPage(),
            ),
          ),
        ));
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();
  void respondToAnswers(bool status) {
    if (quizBrain.isFinished()) {
      //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();
      //TODO: Add some rounding in this application when calclating the percentages of answered questions
      double averageCorrectAnswer =
          (quizBrain.getNumOfCorrectAnswers() / quizBrain.getNumOfQuestion()) *
              100;
      String roundedAverageCorrectNumber =
          averageCorrectAnswer.toStringAsFixed(1);
      Alert(
              context: context,
              title: "Quiz finished",
              desc:
                  "You have reached the end of the quiz.\n You have got ${roundedAverageCorrectNumber} % of questions right. \n You have scored ${quizBrain.getNumOfCorrectAnswers()}/ ${quizBrain.getNumOfQuestion()}. ")
          .show();
      quizBrain.reset();
      setState(() {
        scoreKeeper = [];
      });
    } else {
      if (quizBrain.validateQuestion(status)) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      setState(() {
        quizBrain.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.fromLTRB(100.0, 200.0, 100.0, 100.0),
              child: Text(
                quizBrain.getQuestionText(),
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            )),
        Expanded(
            child: TextButton(
          onPressed: () {
            respondToAnswers(true);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          child: Text(
            'True',
            style: TextStyle(color: Colors.white),
          ),
        )),
        Expanded(
            child: TextButton(
          onPressed: () {
            respondToAnswers(false);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
          child: Text(
            'False',
            style: TextStyle(color: Colors.white),
          ),
        )),
        Row(
          children: scoreKeeper,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Score:  ${quizBrain.getNumOfCorrectAnswers()}/ ${scoreKeeper.length}',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
