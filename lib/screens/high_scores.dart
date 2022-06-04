import 'package:flutter/material.dart';
import 'package:batman/screens/game.dart';
import 'package:batman/screens/high_scores.dart';
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
      //Create a background image with the asset 'images/Batman.png' and set it to the background of the scaffold and add two buttons to the scaffold.
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Batman.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                  },

                  child: Text(
                    'HighScore',

                    style: TextStyle(color: Colors.cyanAccent, fontSize: 80),
                  )),

              SizedBox(height: 40),
              TextButton(
                  onPressed: () {
                  },
                  child: Text(
                    'first',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )),
              SizedBox(height: 40),
              TextButton(
                  onPressed: () {
                  },
                  child: Text(
                    'Second',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )),
              SizedBox(height: 40),
              TextButton(
                  onPressed: () {
                  },
                  child: Text(
                    'Third',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
