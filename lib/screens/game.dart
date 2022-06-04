import 'package:batman/batman.dart';
import 'package:flutter/material.dart';

class game extends StatefulWidget {
  game({Key? key}) : super(key: key);

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> with SingleTickerProviderStateMixin {
  Batman batman = Batman();
  double runDistance = 0;
  double runVelocity = 30;

  late AnimationController controller;
  Duration lastUpdateCall = Duration();

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(days: 99), vsync: this);
    controller.addListener(_update);
    controller.forward();
  }

  _update() {
    batman.update(lastUpdateCall, controller.lastElapsedDuration!);
    lastUpdateCall = controller.lastElapsedDuration!;
  }

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          batman.jump();
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedBuilder(
                animation: controller,
                builder: (context, _) {
                  Rect batmanRect = batman.getRect(screenSize, runDistance);
                  return Positioned(
                      child: batman.render(),
                      left: batmanRect.left,
                      top: batmanRect.top,
                      width: batmanRect.width,
                      height: batmanRect.height);
                }),
          ],
        ),
      ),
    );
  }
}
