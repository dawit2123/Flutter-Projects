import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
        theme: ThemeData(fontFamily: 'Roboto'),
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.red,
            appBar: AppBar(
              title: Center(
                child: Text(
                  'Dicee',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              backgroundColor: Colors.red,
            ),
            body: Center(
              child: DicePage(),
            ),
          ),
        )),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftNumber = 1;
  int rightNumber = 1;
  void setNumbers() {
    setState(() {
      leftNumber = Random().nextInt(6) + 1;
      rightNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Colors.blue.withOpacity(0);
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed))
                    return Colors.blue.withOpacity(0);
                  return null; // Defer to the widget's default.
                },
              ),
            ),
            child: Image(
              image: AssetImage('images/dice$leftNumber.png'),
            ),
            onPressed: () {
              setNumbers();
            },
          )),
          Expanded(
              child: TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Colors.blue.withOpacity(0);
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed))
                    return Colors.blue.withOpacity(0);
                  return null; // Defer to the widget's default.
                },
              ),
            ),
            child: Image.asset('images/dice$rightNumber.png'),
            onPressed: () {
              setNumbers();
            },
          ))
        ],
      ),
    );
  }
}
