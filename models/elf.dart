import 'conveyor_belt.dart';
import 'furniture.dart';
import 'gift_wrap.dart';
import 'object.dart';
import 'packaging.dart';
import 'table.dart';
import 'toy.dart';

class Elf {
  String nickname;

  Elf(this.nickname);

  void pack(Packaging packaging, Toy toy) {
    if (!packaging.isOpen && !(packaging is GiftWrap))
      return print('Sorry this package is not open');

    if (packaging.toy != null)
      return print('Sorry this package already filled');

    packaging.insert(toy);
    print('Yeaaaah! Just packing the toy ~~ ${toy.type} ~~');
  }

  Toy unpack(Packaging packaging) {
    if (packaging.isOpen || packaging.toy == null) {
      print('Sorry this package is already empty');
      return null;
    }

    Toy toy = packaging.toy;
    packaging.toy = null;
    packaging.open();
    print('Ooooooh! Just unpacking the toy ~~ ${toy.type} ~~');
    return toy;
  }

  bool put(Furniture furniture, BaseObject obj) {
    print('$nickname put a ${obj.runtimeType} on ${furniture.runtimeType}');
    return furniture.put(obj);
  }

  BaseObject take(Furniture furniture) {
    BaseObject obj = furniture.take();
    print('$nickname take an ${obj.runtimeType} from ${furniture.runtimeType}');
    return obj;
  }

  void btnIn(ConveyorBelt conveyorBelt) {
    print('$nickname has pushed IN button');
    conveyorBelt.btnIn();
  }

  void btnOut(ConveyorBelt conveyorBelt) {
    print('$nickname has pushed OUT button');
    conveyorBelt.btnOut();
  }

  void pressInBtnAndPackage(Table table, ConveyorBelt conveyorBelt) {
    btnIn(conveyorBelt);
    BaseObject objCreated = conveyorBelt.take();
    if (objCreated is Packaging) {
      int index = table.searchIndex('Toy');
      if (index == -1) {
        print('There is no Toy on table');
        _handleNoMatch(table, conveyorBelt, objCreated);
        return;
      }

      Toy toy = table.takePos(index);
      pack(objCreated, toy);
      put(conveyorBelt, objCreated);
      btnOut(conveyorBelt);
    } else if (objCreated is Toy) {
      int index = table.searchIndex('Packaging');
      if (index == -1) {
        print('There is no packaging on table');
        _handleNoMatch(table, conveyorBelt, objCreated);
        return;
      }

      Packaging packaging = table.takePos(index);
      pack(packaging, objCreated);
      put(conveyorBelt, packaging);
      btnOut(conveyorBelt);
    }
  }

  void _handleNoMatch(Table table, ConveyorBelt conveyorBelt, BaseObject obj) {
    bool isObjPut = put(table, obj);
    if (!isObjPut) {
      put(conveyorBelt, obj);
      btnOut(conveyorBelt);
    }
  }

  @override
  bool operator ==(Object other) => other is Elf && other.nickname == nickname;
}
