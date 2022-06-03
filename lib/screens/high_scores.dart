import 'package:flutter/material.dart';

class highScores extends StatefulWidget {
  highScores({Key? key}) : super(key: key);

  @override
  State<highScores> createState() => _highScoresState();
}

class _highScoresState extends State<highScores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('High Scores'),
      ),
    );
  }
}
