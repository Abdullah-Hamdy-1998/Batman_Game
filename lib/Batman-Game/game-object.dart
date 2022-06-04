import 'package:flutter/widgets.dart';

abstract class GameObject{
  Widget render();
  Rect getRect(Size screensize, double runDistance);
  void update(Duration lastUpdate, Duration elapsedTime){}
}