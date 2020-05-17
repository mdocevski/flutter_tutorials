import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              padding: EdgeInsets.all(16.0),
              child: Image.asset('images/dice$leftDiceNumber.png'),
              onPressed: () {
                randomizeDiceNumbers();
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              padding: EdgeInsets.all(16.0),
              child: Image.asset('images/dice$rightDiceNumber.png'),
              onPressed: () {
                randomizeDiceNumbers();
              },
            ),
          ),
        ],
      ),
    );
  }

  void randomizeDiceNumbers() {
    setState(() {
      leftDiceNumber = randomDiceNumber();
      rightDiceNumber = randomDiceNumber();
    });
  }

  int randomDiceNumber() => 1 + random.nextInt(6);
}
