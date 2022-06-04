import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'Evil-Man.dart';
import 'constants.dart';
import 'game-object.dart';
import 'sprite.dart';

List<Sprite> batman = [
  Sprite()
    ..imagePath ="assets/images/"
    ..imageWidth = 88
    ..imageHieght = 94,
  Sprite()
    ..imagePath ="assets/images/"
    ..imageWidth = 88
    ..imageHieght = 94,
  Sprite()
    ..imagePath ="assets/images/"
    ..imageWidth = 88
    ..imageHieght = 94,
  Sprite()
    ..imagePath ="assets/images/"
    ..imageWidth = 88
    ..imageHieght = 94,
  Sprite()
    ..imagePath ="assets/images/"
    ..imageWidth = 88
    ..imageHieght = 94,
  Sprite()
    ..imagePath ="assets/images/"
    ..imageWidth = 88
    ..imageHieght = 94,
];

enum BatmanState{
  jumping,
  running,
  dead,
}

class Batman extends GameObject{
  Sprite currentSprite = batman[0];
  double dispY = 0;
  double velY = 0;
  BatmanState state = BatmanState.running;

  @override
  Widget render() {
    return Image.asset(currentSprite.imagePath);
  }

  @override
  Rect getRect(Size screensize, double runDistance) {
    return Rect.fromLTWH(
      screensize.width / 10,
      screensize.height / 2 - currentSprite.imageHieght - dispY,
      currentSprite.imageWidth.toDouble(),
      currentSprite.imageHieght.toDouble(),
    );
  }

  @override
  void update(Duration lastTime, Duration currentTime){
    currentSprite = batman[(currentTime.inMilliseconds / 100).floor()%2+2];
    double elapsedTimeSeconds = (currentTime - lastTime).inMilliseconds / 1000;
    dispY += velY * elapsedTimeSeconds;
    if(dispY <=0){
      dispY = 0;
      velY = 0;
      state = BatmanState.running;
    }else{
      velY -= GRAVITY_PPSS * elapsedTimeSeconds;
    }
  }

  void jump(){
    if(state != BatmanState.jumping){
      state = BatmanState.jumping;
      velY = 650;
    }
  }

  void die(){
    currentSprite = batman[5];
    state = BatmanState.dead;
  }
}