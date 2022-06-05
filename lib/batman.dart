import 'dart:ui';

import 'package:batman/constants.dart';
import 'package:batman/game-object.dart';
import 'package:batman/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

List<Sprite> batman = [
  Sprite()
    ..imagePath = "images/batman/1.png"
    ..imageWidth = 88
    ..imageHeight = 94,
  Sprite()
    ..imagePath = "images/batman/2.png"
    ..imageWidth = 88
    ..imageHeight = 94,
  Sprite()
    ..imagePath = "images/batman/3.png"
    ..imageWidth = 88
    ..imageHeight = 94,
  Sprite()
    ..imagePath = "images/batman/4.png"
    ..imageWidth = 88
    ..imageHeight = 94,
  Sprite()
    ..imagePath = "images/batman/5.png"
    ..imageWidth = 88
    ..imageHeight = 94,
  Sprite()
    ..imagePath = "images/batman/6.png"
    ..imageWidth = 88
    ..imageHeight = 94,
];

enum BatmanState { running, jumping, dead }

class Batman extends GameObject {
  late Sprite currentSprite = batman[0];
  double dispY = 0;
  double velY = 0;
  BatmanState state = BatmanState.running;

  @override
  Rect getRect(Size screenSize, double runDistance) {
    return Rect.fromLTWH(
      screenSize.width / 10,
      screenSize.height - currentSprite.imageHeight - dispY - 10,
      currentSprite.imageWidth.toDouble(),
      currentSprite.imageHeight.toDouble(),
    );
  }

  @override
  Widget render() {
    return Image.asset(
      currentSprite.imagePath,
      scale: 0.2,
    );
  }

  @override
  void update(Duration lastTime, Duration currentTime) {
    currentSprite = batman[(currentTime.inMilliseconds / 100).floor() % 5 + 1];

    double elapsedTimeSeconds = (currentTime - lastTime).inMilliseconds / 1000;

    dispY += velY * elapsedTimeSeconds;
    if (dispY <= 0) {
      dispY = 0;
      velY = 0;
      state = BatmanState.running;
    } else {
      velY -= GRAVITY_PPSS * elapsedTimeSeconds;
    }
  }

  void jump() {
    if (state != BatmanState.jumping) {
      state = BatmanState.jumping;
      velY = 1000;
    }
  }

  void die() {
    currentSprite = batman[5];
    state = BatmanState.dead;
  }
}
