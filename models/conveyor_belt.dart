import 'dart:math';

import 'box.dart';
import 'dragonball.dart';
import 'gift_wrap.dart';
import 'object.dart';
import 'furniture.dart';
import 'pony.dart';

class ConveyorBelt extends Furniture {
  BaseObject _currentObject;
  bool _isBusy = false;

  BaseObject get currentObject => _currentObject;

  void set currentObject(BaseObject object) {
    _currentObject = object;
    _isBusy = object != null;
  }

  bool get isBusy => _isBusy;

  @override
  bool put(BaseObject obj) {
    if (isBusy) {
      print("Sorry the conveyor is busy.");
      return false;
    }
    currentObject = obj;
    return true;
  }

  @override
  BaseObject take() {
    if (!isBusy) {
      print("Sorry, there is no object.");
      return null;
    }
    BaseObject object = currentObject;
    currentObject = null;
    return object;
  }

  BaseObject _generateObject() {
    int rand = Random().nextInt(4);
    if (rand == 0) return Box();
    if (rand == 1) return GiftWrap();
    if (rand == 2) return DragonBall.random();
    return Pony();
  }

  // In Dart 'in' is already taken :/
  void btnIn() => put(_generateObject());

  void btnOut() => currentObject = null;

  void look() => '$currentObject';
}
