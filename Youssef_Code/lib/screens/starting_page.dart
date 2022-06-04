import 'package:game_final_project/screens/game.dart';
import 'package:game_final_project/screens/high_scores.dart';
import 'package:flutter/material.dart';

class starting extends StatefulWidget {
  starting({Key? key}) : super(key: key);

  @override
  State<starting> createState() => _startingState();
}

class _startingState extends State<starting> {
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => game()),
                    );
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )),
              SizedBox(height: 40),
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