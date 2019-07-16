import 'package:rush_efrei_klaus/models/furniture/conveyor_belt.dart';
import 'package:rush_efrei_klaus/models/object.dart';
import 'package:rush_efrei_klaus/patterns/pfurniture.dart';

abstract class PConveyorBelt extends PFurniture {
  ConveyorBelt makeConveyorBelt();
  BaseObject generateObject();
}
