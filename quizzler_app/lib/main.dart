// import 'package:flutter/material.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'quiz_brain.dart';

// QuizBrain quizBrain = QuizBrain();

// void main() => runApp(const Quizzler());

// class Quizzler extends StatelessWidget {
//   const Quizzler({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey.shade900,
//         body: const SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: QuizPage(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class QuizPage extends StatefulWidget {
//   const QuizPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _QuizPageState createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {
//   List<Icon> scoreKeeper = [];

//   void checkAnswer(bool userPickedAnswer) {
//     bool correctAnswer = quizBrain.getCorrectAnswer();

//     setState(() {
//       //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
//       //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
//       if (quizBrain.isFinished() == true) {
//         //TODO Step 4 Part A - show an alert using rFlutter_alert,

//         //This is the code for the basic alert from the docs for rFlutter Alert:
//         //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

//         //Modified for our purposes:
//         Alert(
//           context: context,
//           title: 'Finished!',
//           desc: 'You\'ve reached the end of the quiz.',
//         ).show();

//         //TODO Step 4 Part C - reset the questionNumber,
//         quizBrain.reset();

//         //TODO Step 4 Part D - empty out the scoreKeeper.
//         scoreKeeper = [];
//       }

//       //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
//       else {
//         if (userPickedAnswer == correctAnswer) {
//           scoreKeeper.add(const Icon(
//             Icons.check,
//             color: Colors.green,
//           ));
//         } else {
//           scoreKeeper.add(const Icon(
//             Icons.close,
//             color: Colors.red,
//           ));
//         }
//         quizBrain.nextQuestion();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Expanded(
//           flex: 5,
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Center(
//               child: Text(
//                 quizBrain.getQuestionText(),
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 25.0,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: ElevatedButton(
//               style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(
//                 Colors.green,
//               )),
//               child: const Text(
//                 'True',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                 ),
//               ),
//               onPressed: () {
//                 //The user picked true.
//                 checkAnswer(true);
//               },
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: ElevatedButton(
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(
//                   Colors.red,
//                 ),
//               ),
//               child: const Text(
//                 'False',
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   color: Colors.white,
//                 ),
//               ),
//               onPressed: () {
//                 //The user picked false.
//                 checkAnswer(false);
//               },
//             ),
//           ),
//         ),
//         Row(
//           children: scoreKeeper,
//         )
//       ],
//     );
//   }
// }

// /*
// question1: 'You can lead a cow down stairs but not up stairs.', false,
// question2: 'Approximately one quarter of human bones are in the feet.', true,
// question3: 'A slug\'s blood is green.', true,
// */
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'question.dart';

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
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Questions> questions = [
    Questions('You can lead a cow down stairs but not up stairs.', false),
    Questions(
        'Approximately one quarter of human bones are in the feet.', true),
    Questions('A slug\'s blood is green.', true)
  ];
  List<Icon> scoreKeeper = [];
  int questionNumber = 0;
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
                questions[questionNumber].questionText,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            )),
        Expanded(
            child: TextButton(
          onPressed: () {
            setState(() {
              if (questions[questionNumber].questionAnswer == true) {
                print('User got it correct');
              } else {
                print('User got it wrong');
              }
              questionNumber++;
            });
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
            setState(() {
              if (questions[questionNumber].questionAnswer == false) {
                print('User got it correct');
              } else {
                print('User got it wrong');
              }
              questionNumber++;
            });
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
        )
      ],
    );
  }
}
