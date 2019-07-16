import 'package:rush_efrei_klaus/models/object.dart';

abstract class Toy extends BaseObject {
  String _type;

  Toy(this._type);

  String get type => _type;

  void isMoved();

  @override
  bool operator ==(Object other) => other is Toy && other.type == type;
}
