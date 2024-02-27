import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const minimumBottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xffeb1555);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                child: BasicContainer(
                  activeCardColor,
                  Column(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.mars,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Text(
                        'MALE',
                        style:
                            TextStyle(color: Color(0xff8d8e98), fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(child: BasicContainer(activeCardColor, Column())),
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
