import 'object.dart';
import 'toy.dart';

class Packaging extends BaseObject {
  bool _isOpen = false;
  Toy toy;

  Packaging();

  bool get isOpen => _isOpen;

  void open() => _isOpen = true;

  void insert(Toy toy) {
    this.toy = toy;
    _isOpen = false;
  }

  @override
  bool operator ==(Object other) =>
      other is Packaging && other.isOpen == isOpen && other.toy == toy;
}
