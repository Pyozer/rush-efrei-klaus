import 'dart:math';

import '../models/furniture/conveyor_belt.dart';
import '../models/object.dart';
import '../models/packaging/box.dart';
import '../models/packaging/gift_wrap.dart';
import '../models/toy/dragonball.dart';
import '../models/toy/pony.dart';
import 'pconveyorbelt.dart';

class ConveyorBeltFactory implements PConveyorBelt {
  @override
  ConveyorBelt makeConveyorBelt() => ConveyorBelt();

  @override
  BaseObject generateObject() {
    final rand = Random().nextInt(4);
    if (rand == 0) return Box();
    if (rand == 1) return GiftWrap();
    if (rand == 2) return DragonBall.random();
    return Pony();
  }
}
