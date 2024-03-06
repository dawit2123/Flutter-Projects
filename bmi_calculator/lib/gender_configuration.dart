import 'package:flutter/material.dart';
import 'constant.dart';

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
          style: textDefaultStyle,
        )
      ],
    );
  }
}
