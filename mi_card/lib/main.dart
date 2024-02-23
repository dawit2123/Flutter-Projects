// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'KodeMono'),
      home: Scaffold(
          backgroundColor: Colors.teal,
          body: SafeArea(
              child: Column(
            children: <Widget>[
              Container(
                child: CircleAvatar(
                  backgroundColor: Colors.blue[900],
                  radius: 56.0,
                  backgroundImage: AssetImage('images/dawit_zewdu.jpg'),
                ),
              )
            ],
          ))),
    );
  }
}
