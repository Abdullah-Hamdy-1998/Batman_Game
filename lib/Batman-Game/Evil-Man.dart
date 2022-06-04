import 'dart:math';
import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'constants.dart';
import 'game-object.dart';
import 'sprite.dart';

List<Sprite> EVIL = [
  Sprite()
    ..imagePath ="assets/images/"
    ..imageWidth = 104
    ..imageHieght = 100,
  Sprite()
    ..imagePath ="assets/images/"
    ..imageWidth = 50
    ..imageHieght = 100,
  Sprite()
    ..imagePath ="assets/images/"
    ..imageWidth = 98
    ..imageHieght = 100,
  Sprite()
    ..imagePath ="assets/images/"
    ..imageWidth = 34
    ..imageHieght = 70,
  Sprite()
    ..imagePath ="assets/images/"
    ..imageWidth = 68
    ..imageHieght = 70,
  Sprite()
    ..imagePath ="assets/images/"
    ..imageWidth = 107
    ..imageHieght = 70,
];

class Evilman extends GameObject{
  final Sprite sprite;
  final Offset worldLocation;
  Evilman({required this.worldLocation}): sprite = EVIL[Random().nextInt(EVIL.length)];

  @override
  Rect getRect(Size screensize, double runDistance) {
    return Rect.fromLTWH(
      (worldLocation.dx - runDistance) * WORLD_TO_PIXEL_RATIO,
      screensize.height / 2 - sprite.imageHieght,
      sprite.imageHieght.toDouble(),
      sprite.imageWidth.toDouble(),
    );
  }

  @override
  Widget render() {
    return Image.asset(sprite.imagePath);
  }

}