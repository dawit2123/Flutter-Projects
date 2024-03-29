// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Roboto'),
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
          title: Text(
            "I Am Rich",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey[900]),
      body: Center(
          child: Image(
        image: AssetImage('images/diamond.png'),
      )),
    ),
  ));
}
