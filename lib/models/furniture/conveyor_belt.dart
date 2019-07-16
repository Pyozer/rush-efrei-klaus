import '../../patterns/conveyor_belt_factory.dart';
import '../object.dart';
import 'furniture.dart';

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
  void btnIn() => put(ConveyorBeltFactory().generateObject());
  void btnOut() => currentObject = null;

  void look() => '$currentObject';
}
