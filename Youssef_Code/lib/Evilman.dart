//  Turkey Code   *my_code: [1 -> 59]*
//  I added two images

import 'dart:math';
import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'constants.dart';
import 'game-object.dart';
import 'sprite.dart';

List<Sprite> EVIL = [
  Sprite()
    ..imagePath ="images/batman/8.png"
    ..imageWidth = 104
    ..imageHeight = 100,
  Sprite()
    ..imagePath ="images/batman/9.png"
    ..imageWidth = 50
    ..imageHeight = 100,
];

class Evilman extends GameObject{
  final Sprite sprite;
  final Offset worldLocation;
  Evilman({required this.worldLocation}): sprite = EVIL[Random().nextInt(EVIL.length)];

  @override
  Rect getRect(Size screensize, double runDistance) {
    return Rect.fromLTWH(
      (worldLocation.dx - runDistance) * WORLD_TO_PIXEL_RATIO,
      screensize.height / 2 - sprite.imageHeight,
      sprite.imageHeight.toDouble(),
      sprite.imageWidth.toDouble(),
    );
  }

  @override
  Widget render() {
    return Image.asset(sprite.imagePath);
  }

}