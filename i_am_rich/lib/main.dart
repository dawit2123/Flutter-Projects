import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
            "This is the app bar",
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: Colors.blueGrey[900]),
    ),
  ));
}
