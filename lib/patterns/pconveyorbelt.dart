import '../models/furniture/conveyor_belt.dart';
import '../models/object.dart';

abstract class PConveyorBelt {
  ConveyorBelt makeConveyorBelt();
  BaseObject generateObject();
}
