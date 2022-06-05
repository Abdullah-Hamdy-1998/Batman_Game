import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'game-object.dart';
import 'sprite.dart';

Sprite groundSprite = Sprite()
  ..imagePath = "images/batman/bg.png"
  ..imageWidth = 1000
  ..imageHeight = 750;

class Ground extends GameObject {
  final Offset worldLocation;

  Ground({required this.worldLocation});

  @override
  Rect getRect(Size screensize, double runDistance) {
    return Rect.fromLTWH(
      (worldLocation.dx - runDistance) * WORLD_TO_PIXEL_RATIO,
      screensize.height - groundSprite.imageHeight,
      groundSprite.imageWidth.toDouble(),
      groundSprite.imageHeight.toDouble(),
    );
  }

  @override
  Widget render() {
    return Image.asset(groundSprite.imagePath, fit: BoxFit.fill);
  }
}
