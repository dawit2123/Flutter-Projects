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
  @override
  int diceNumber1 = 1;
  int diceNumber2 = 1;
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: FloatingActionButton.large(
            child: Image(
              image: AssetImage('images/dice$diceNumber1.png'),
            ),
            onPressed: () {
              setState(() {
                diceNumber1 = Random().nextInt(6) + 1;
              });
            },
          )),
          Expanded(
              child: FloatingActionButton.large(
            child: Image.asset('images/dice$diceNumber2.png'),
            onPressed: () {
              setState(() {
                diceNumber2 = Random().nextInt(6) + 1;
              });
            },
          ))
        ],
      ),
    );
  }
}
