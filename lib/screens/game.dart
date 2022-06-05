import 'dart:math';

import 'package:batman/game-object.dart';
import 'package:batman/Evilman.dart';
import 'package:batman/batman.dart';
import 'package:batman/cloud.dart';
import 'package:batman/ground.dart';
import 'package:flutter/material.dart';

class game extends StatefulWidget {
  game({Key? key}) : super(key: key);

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> with SingleTickerProviderStateMixin {
  Batman bat = Batman();
  double runDistance = 0;
  double runVelocity = 30;

  late AnimationController worldController;
  Duration lastUpdateCall = Duration();

  List<Evilman> evil = [Evilman(worldLocation: Offset(200, 0))];

  @override
  void initState() {
    super.initState();

    worldController =
        AnimationController(vsync: this, duration: Duration(days: 99));
    worldController.addListener(_update);
    worldController.forward();
  }

  //youssef_abdelrahman begin
  List<Ground> ground = [
    Ground(worldLocation: Offset(0, 0)),
    Ground(worldLocation: Offset(groundSprite.imageWidth / 10, 0))
  ];

  List<Cloud> clouds = [
    Cloud(worldLocation: Offset(100, 20)),
    Cloud(worldLocation: Offset(200, 10)),
    Cloud(worldLocation: Offset(350, -10)),
  ];
  //youssef_abdelrahman end

  void _die() {
    setState(() {
      worldController.stop();
      bat.die();
    });
  }

  _update() {
    bat.update(lastUpdateCall, worldController.lastElapsedDuration!);

    double elapsedTimeSeconds =
        (worldController.lastElapsedDuration! - lastUpdateCall).inMilliseconds /
            1000;

    runDistance += runVelocity * elapsedTimeSeconds;

    Size screensize = MediaQuery.of(context).size;

    Rect batRect = bat.getRect(screensize, runDistance).deflate(5);
    for (Evilman e in evil) {
      Rect obstacleRect = e.getRect(screensize, runDistance);
      if (batRect.overlaps(obstacleRect.deflate(5))) {
        _die();
      }

      if (obstacleRect.right < 0) {
        setState(() {
          evil.remove(e);
          evil.add(Evilman(
              worldLocation:
                  Offset(runDistance + Random().nextInt(100) + 50, 0)));
        });
      }
    }

    //youssef_abdelrahman begin
    for (Ground groundlet in ground) {
      if (groundlet.getRect(screensize, runDistance).right < 0) {
        setState(() {
          ground.remove(groundlet);
          ground.add(Ground(
              worldLocation: Offset(
                  ground.last.worldLocation.dx + groundSprite.imageWidth / 10,
                  0)));
        });
      }
    }
    for (Cloud cloud in clouds) {
      if (cloud.getRect(screensize, runDistance).right < 0) {
        setState(() {
          clouds.remove(cloud);
          clouds.add(Cloud(
              worldLocation: Offset(
                  clouds.last.worldLocation.dx + Random().nextInt(100) + 50,
                  Random().nextInt(40) - 20.0)));
        });
      }
    } //youssef_abdelrahman end

    lastUpdateCall = worldController.lastElapsedDuration!;
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    List<Widget> childern = [];
    for (GameObject object in [...clouds, ...ground, ...evil, bat]) {
      childern.add(AnimatedBuilder(
          animation: worldController,
          builder: (context, _) {
            Rect objectRect = object.getRect(screensize, runDistance);
            return Positioned(
              left: objectRect.left,
              top: objectRect.top,
              width: objectRect.width,
              height: objectRect.height,
              child: object.render(),
            );
          }));
    }

    return Scaffold(
      body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            bat.jump();
          },
          child: Stack(
            alignment: Alignment.center,
            children: childern,
          )),
    );
  }
}
