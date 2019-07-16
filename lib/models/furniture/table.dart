import 'package:rush_efrei_klaus/models/furniture/furniture.dart';
import 'package:rush_efrei_klaus/models/object.dart';
import 'package:rush_efrei_klaus/models/packaging/packaging.dart';
import 'package:rush_efrei_klaus/models/toy/toy.dart';
import 'package:rush_efrei_klaus/patterns/table_factory.dart';

class Table extends Furniture<TableFactory> {
  List<BaseObject> _content = [];

  Table(TableFactory tableFactory) : super(tableFactory);

  @override
  bool put(BaseObject obj) {
    if (_content.length > 10) {
      print("A table can't hold more than 10 objects !");
      return false;
    }
    _content.add(obj);
    return true;
  }

  @override
  BaseObject take() => _content.removeLast();

  BaseObject takePos(int pos) {
    if (pos == null || pos < 0 || pos >= _content.length) return null;
    return _content.removeAt(pos);
  }

  @override
  List<String> look() => _content
      .map((e) => e is Toy ? 'Toy' : e is Packaging ? 'Packaging' : '')
      .toList();

  int searchIndex(String type) => look().indexWhere((o) => o == type);
}
