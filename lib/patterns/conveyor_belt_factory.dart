import 'dart:math';

import 'package:rush_efrei_klaus/models/furniture/conveyor_belt.dart';
import 'package:rush_efrei_klaus/models/object.dart';
import 'package:rush_efrei_klaus/models/packaging/box.dart';
import 'package:rush_efrei_klaus/models/packaging/gift_wrap.dart';
import 'package:rush_efrei_klaus/models/toy/dragonball.dart';
import 'package:rush_efrei_klaus/models/toy/pony.dart';
import 'package:rush_efrei_klaus/patterns/pconveyorbelt.dart';

class ConveyorBeltFactory implements PConveyorBelt {
  @override
  ConveyorBelt makeConveyorBelt() => ConveyorBelt(this);

  @override
  BaseObject generateObject() {
    final rand = Random().nextInt(4);
    if (rand == 0) return Box();
    if (rand == 1) return GiftWrap();
    if (rand == 2) return DragonBall.random();
    return Pony();
  }
}
