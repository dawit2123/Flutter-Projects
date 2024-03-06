import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_configuration.dart';
import 'basic_container.dart';
import "constant.dart";

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
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
                      selectedGender = Gender.male;
                    })
                  },
                  child: BasicContainer(
                    selectedGender == Gender.male
                        ? activeCardColor
                        : inActiveCardColor,
                    GenderConfigurations(FontAwesomeIcons.mars, 'MALE'),
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () => setState(() {
                  selectedGender = Gender.female;
                }),
                child: BasicContainer(
                    selectedGender == Gender.female
                        ? activeCardColor
                        : inActiveCardColor,
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
