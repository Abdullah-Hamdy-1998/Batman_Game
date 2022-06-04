import 'dart:ui';

import 'package:game_final_project/game-object.dart';
import 'package:game_final_project/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'constants.dart';

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

//  Turkey Code   *my_code: [40 -> 43]*
//  I added identifiers (dispY, velY, state)
//  I changed the path at 'code: [1]' to " game_final_project/.... "
class Batman extends GameObject {
  late Sprite currentSprite = batman[0];
  late double dispY = 0;
  late double velY = 0;
  late BatmanState state = BatmanState.running;

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

  //  Turkey Code   *my_code: [68 -> 77]*
  //  I added identifier (elapsedTimeSeconds) to run
  //  Notice that I added a path at 'code: [8]' to " constants.dart "
  @override
  void update(Duration lastUpdate, Duration currentTime) {
    currentSprite = batman[(currentTime.inMilliseconds / 100).floor() % 5 + 1];
    double elapsedTimeSeconds = (currentTime - lastUpdate).inMilliseconds / 1000;
    dispY += velY * elapsedTimeSeconds;
    if(dispY <=0){
      dispY = 0;
      velY = 0;
      state = BatmanState.running;
    }else{
      velY -= GRAVITY_PPSS * elapsedTimeSeconds;
    }
  }

  //  Turkey Code   *my_code: [81 -> 86]*
  //  I added function (jump())
  void jump(){
    if(state != BatmanState.jumping){
      state = BatmanState.jumping;
      velY = 650;
    }
  }

  //  Turkey Code   *my_code: [90 -> 94]*
  //  I added function (die())
  void die(){
    currentSprite = batman[5];
    state = BatmanState.dead;
  }
}