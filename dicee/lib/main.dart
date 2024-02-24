import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
        theme: ThemeData(fontFamily: 'Roboto'),
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.red,
            appBar: AppBar(
              title: Text(
                'Dicee',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
            body: DicePage(),
          ),
        )),
  );
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Image(
              image: AssetImage('images/dice1.png'),
            ),
          ),
          Expanded(
            child: Image.asset('images/dice1.png'),
          )
        ],
      ),
    );
  }
}
