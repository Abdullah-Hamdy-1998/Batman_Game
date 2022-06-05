import 'dart:math';
import 'dart:ui';

import 'package:batman/sprite.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:batman/game-object.dart';
import 'package:batman/constants.dart';

List<Sprite> EVIL = [
  Sprite()
    ..imagePath = "images/batman/8.png"
    ..imageWidth = 104
    ..imageHeight = 100,
  Sprite()
    ..imagePath = "images/batman/8.png"
    ..imageWidth = 104
    ..imageHeight = 100,
];

class Evilman extends GameObject {
  final Sprite sprite;
  final Offset worldLocation;
  Evilman({required this.worldLocation})
      : sprite = EVIL[Random().nextInt(EVIL.length)];

  @override
  Rect getRect(Size screensize, double runDistance) {
    return Rect.fromLTWH(
      (worldLocation.dx - runDistance) * WORLD_TO_PIXEL_RATIO,
      screensize.height - sprite.imageHeight - 10,
      sprite.imageHeight.toDouble(),
      sprite.imageWidth.toDouble(),
    );
  }

  @override
  Widget render() {
    return Image.asset(sprite.imagePath);
  }
}
