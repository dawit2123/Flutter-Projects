import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_configuration.dart';
import 'basic_container.dart';

const minimumBottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xffeb1555);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  void activeColorSet(String gender) {
    if (gender == 'male') {
      maleColor = activeCardColor;
      femaleColor = inActiveCardColor;
    } else if (gender == 'female') {
      maleColor = inActiveCardColor;
      femaleColor = activeCardColor;
    }
  }

  Color maleColor = activeCardColor;
  Color femaleColor = activeCardColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text('BMI CALCULATOR'),
      )),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () => {
                    setState(() {
                      activeColorSet('male');
                    })
                  },
                  child: BasicContainer(
                    maleColor,
                    GenderConfigurations(FontAwesomeIcons.mars, 'MALE'),
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () => setState(() {
                  activeColorSet('female');
                }),
                child: BasicContainer(femaleColor,
                    GenderConfigurations(FontAwesomeIcons.venus, 'FEMALE')),
              )),
            ],
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(child: BasicContainer(activeCardColor, Column()))
            ],
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(child: BasicContainer(activeCardColor, Column())),
              Expanded(child: BasicContainer(activeCardColor, Column()))
            ],
          )),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            height: minimumBottomContainerHeight,
            width: double.infinity,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //TODO: some logic here
        },
      ),
    );
  }
}
