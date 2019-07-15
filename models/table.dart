import 'object.dart';
import 'furniture.dart';
import 'packaging.dart';
import 'toy.dart';

class Table extends Furniture {
  List<BaseObject> _content = [];

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
    return _content[pos];
  }

  List<String> look() => _content
      .map((e) => e is Toy ? "Toy" : e is Packaging ? "Packaging" : "")
      .toList();
}
