import 'package:game_final_project/batman.dart';
import 'package:flutter/material.dart';

class game extends StatefulWidget {
  game({Key? key}) : super(key: key);

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> with SingleTickerProviderStateMixin {
  Batman batman = Batman();
  double runDistance = 0;

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
    Rect batmanRect = batman.getRect(screenSize, runDistance);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return Positioned(
                    child: batman.render(),
                    left: batmanRect.left,
                    top: batmanRect.top,
                    width: batmanRect.width,
                    height: batmanRect.height);
              }),
        ],
      ),
    );
  }
}