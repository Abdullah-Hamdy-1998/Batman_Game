import 'dart:math';
import 'dart:ui';
import 'package:flutter/widgets.dart';

import 'constants.dart';
import 'game-object.dart';
import 'sprite.dart';


List<Sprite> cloudSprite = [
    Sprite()
    ..imagePath = "images/batman/10.png"
    ..imageWidth = 92
    ..imageHeight = 27,
  Sprite()
    ..imagePath = "images/batman/11.png"
    ..imageWidth = 92
    ..imageHeight = 27,
  Sprite()
    ..imagePath = "images/batman/12.png"
    ..imageWidth = 92
    ..imageHeight = 27,
];

class Cloud extends GameObject {
  final Offset worldLocation;
  final Sprite sprite;

  Cloud({required this.worldLocation}): sprite = cloudSprite[Random().nextInt(cloudSprite.length)];

  @override
  Rect getRect(Size screenSize, double runDistance) {
    return Rect.fromLTWH(
      (worldLocation.dx - runDistance) * WORLD_TO_PIXEL_RATIO / 5,
      screenSize.height / 5 - sprite.imageHeight - worldLocation.dy,
      sprite.imageWidth.toDouble(),
      sprite.imageHeight.toDouble(),
    );
  }

  @override
  Widget render() {
    return Image.asset(sprite.imagePath);
  }
}