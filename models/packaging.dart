import 'object.dart';
import 'toy.dart';

class Packaging extends BaseObject {
  bool _isOpen;
  Toy toy;

  Packaging();

  bool get isOpen => _isOpen ?? true;

  void open() => _isOpen = true;

  void insert(Toy toy) {
    this.toy = toy;
    _isOpen = false;
  }

  @override
  bool operator ==(Object other) =>
      other is Packaging && other.isOpen == isOpen && other.toy == toy;
}
