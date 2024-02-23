// ignore_for_file: prefer_const_constructors
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: Scaffold(
          backgroundColor: Colors.teal,
          body: Center(
            child: SafeArea(
                child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.blue[900],
                  radius: 56.0,
                  backgroundImage: AssetImage('images/dawit_zewdu.jpg'),
                ),
                Text(
                  'Dawit Zewdu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    fontFamily: 'Pacifico',
                  ),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                    letterSpacing: 3.0,
                  ),
                ),
                //container for the phone number and email
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      SizedBox(width: 10.0),
                      Text('+251 97 790 4892'),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      SizedBox(width: 10.0),
                      Text('dawitzewdu2123@gmail.com')
                    ],
                  ),
                ),
              ],
            )),
          )),
    );
  }
}
