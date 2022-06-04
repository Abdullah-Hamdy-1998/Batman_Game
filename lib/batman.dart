import 'dart:ui';

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

  @override
  Rect getRect(Size screenSize, double runDistance) {
    return Rect.fromLTWH(
      screenSize.width / 15,
      screenSize.height / 2 - currentSprite.imageHeight,
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
  void update(Duration lastUpdate, Duration currentTime) {
    currentSprite = batman[(currentTime.inMilliseconds / 100).floor() % 5 + 1];
  }
}
