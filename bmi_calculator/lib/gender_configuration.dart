import 'package:flutter/material.dart';

class GenderConfigurations extends StatelessWidget {
  String gender;
  IconData icon;
  GenderConfigurations(this.icon, this.gender);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 18.0,
        ),
        Text(
          gender,
          style: TextStyle(color: Color(0xff8d8e98), fontSize: 18.0),
        )
      ],
    );
  }
}
