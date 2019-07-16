

import 'package:rush_efrei_klaus/models/furniture/furniture.dart';
import 'package:rush_efrei_klaus/models/object.dart';
import 'package:rush_efrei_klaus/models/packaging/packaging.dart';
import 'package:rush_efrei_klaus/models/toy/toy.dart';
import 'package:rush_efrei_klaus/patterns/conveyor_belt_factory.dart';

class ConveyorBelt extends Furniture<ConveyorBeltFactory> {
  BaseObject _currentObject;
  bool _isBusy = false;

  ConveyorBelt(ConveyorBeltFactory conveyorBeltFactory)
      : super(conveyorBeltFactory);

  BaseObject get currentObject => _currentObject;

  void set currentObject(BaseObject object) {
    _currentObject = object;
    _isBusy = object != null;
  }

  bool get isBusy => _isBusy;

  @override
  bool put(BaseObject obj) {
    if (isBusy) {
      print('Sorry the conveyor is busy.');
      return false;
    }
    currentObject = obj;
    return true;
  }

  @override
  BaseObject take() {
    if (!isBusy) {
      print('Sorry, there is no object.');
      return null;
    }
    BaseObject object = currentObject;
    currentObject = null;
    return object;
  }

  // In Dart 'in' is already taken :/
  void btnIn() => put(manager.generateObject());
  void btnOut() => currentObject = null;

  @override
  List<String> look() {
    if (currentObject is Packaging) return ['Packaging'];
    if (currentObject is Toy) return ['Toy'];
    return [''];
  }
}
