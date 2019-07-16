import 'package:rush_efrei_klaus/models/object.dart';
import 'package:rush_efrei_klaus/patterns/pfurniture.dart';

abstract class Furniture<TypeManager extends PFurniture> {
  final TypeManager manager;

  Furniture(this.manager);

  bool put(BaseObject object);
  BaseObject take();
  List<String> look();
}
