import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: EightBallPage(),
      ),
    );

class EightBallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Ask me anything'),
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Center(
        child: Image.asset('images/ball$ballNumber.png'),
      ),
      onPressed: () {
        setState(() {
          ballNumber = 1 + random.nextInt(5);
        });
      },
    );
  }
}
