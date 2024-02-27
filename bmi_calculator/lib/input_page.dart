import 'package:flutter/material.dart';

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
                child: BasicContainer(Color(0xFF1D1E33)),
              ),
              Expanded(child: BasicContainer(Color(0xFF1D1E33))),
            ],
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(child: BasicContainer(Color(0xFF1D1E33)))
            ],
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(child: BasicContainer(Color(0xFF1D1E33))),
              Expanded(child: BasicContainer(Color(0xFF1D1E33)))
            ],
          )),
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
  Color color;
  BasicContainer(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: color),
    );
  }
}
