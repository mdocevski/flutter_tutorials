import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final audioPlayer = AudioCache();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              KeyboardKey(
                color: Colors.red,
                tone: 1,
                audioPlayer: audioPlayer,
              ),
              KeyboardKey(
                color: Colors.orange,
                tone: 2,
                audioPlayer: audioPlayer,
              ),
              KeyboardKey(
                color: Colors.yellow,
                tone: 3,
                audioPlayer: audioPlayer,
              ),
              KeyboardKey(
                color: Colors.green,
                tone: 4,
                audioPlayer: audioPlayer,
              ),
              KeyboardKey(
                color: Colors.teal,
                tone: 5,
                audioPlayer: audioPlayer,
              ),
              KeyboardKey(
                color: Colors.blue,
                tone: 6,
                audioPlayer: audioPlayer,
              ),
              KeyboardKey(
                color: Colors.purple,
                tone: 7,
                audioPlayer: audioPlayer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({
    Key key,
    @required this.color,
    @required this.tone,
    @required this.audioPlayer,
  }) : super(key: key);

  final AudioCache audioPlayer;
  final int tone;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          audioPlayer.play('note$tone.wav');
        },
      ),
    );
  }
}
