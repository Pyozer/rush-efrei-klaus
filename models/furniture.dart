import 'object.dart';

abstract class Furniture {
  bool put(BaseObject object);
  BaseObject take();
  void look();
}
