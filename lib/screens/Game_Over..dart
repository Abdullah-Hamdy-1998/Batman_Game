import 'package:batman/screens/game.dart';
import 'package:batman/screens/high_scores.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class gameover extends StatefulWidget {
  gameover({Key? key}) : super(key: key);

  @override
  State<gameover> createState() => _gameover();
}

class _gameover extends State<gameover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                      'GameOver',

                      style: TextStyle(color: Colors.red, fontSize: 80),
                    )),

                SizedBox(height: 40),


                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => game()),
                      );
                    },
                    child: Text(
                      'PlayAgaine',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )),
                SizedBox(height:5),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => highScores()),
                      );
                    },
                    child: Text(
                      'High Scores',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )),
              ],
            ),
          ),
        ),
    );
  }
}



