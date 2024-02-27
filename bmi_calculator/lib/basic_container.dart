import 'package:flutter/material.dart';

class BasicContainer extends StatelessWidget {
  final Color color;
  final Widget childWidget;
  BasicContainer(this.color, this.childWidget);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: color),
    );
  }
}
