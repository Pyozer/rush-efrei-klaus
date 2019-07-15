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
      return print("Sorry this package is not open");

    if (packaging.toy != null)
      return print("Sorry this package already filled");

    packaging.insert(toy);
    print("Yeaaaah! Just packing the toy ~~ ${toy.type} ~~");
  }

  Toy unpack(Packaging packaging) {
    if (packaging.isOpen || packaging.toy == null) {
      print("Sorry this package is already empty");
      return null;
    }

    Toy toy = packaging.toy;
    packaging.toy = null;
    packaging.open();
    print("Ooooooh! Just unpacking the toy ~~ ${toy.type} ~~");
    return toy;
  }

  bool put(Furniture furniture, BaseObject obj) {
    print("$nickname put an object on furniture !");
    return furniture.put(obj);
  }

  Object take(Furniture furniture) {
    print("$nickname take an object from furniture !");
    return furniture.take();
  }

  void pressInBtnAndPackage(Table table, ConveyorBelt conveyorBelt) {
    conveyorBelt.btnIn();
    BaseObject objCreated = conveyorBelt.take();
    if (objCreated is Packaging) {
      int index = table.look().indexWhere((o) => o == "Toy");
      Toy toy = table.takePos(index);

      if (toy == null) {
        print("There is no Toy on table");
        _handleNoMatch(table, conveyorBelt, objCreated);
        return;
      }

      pack(objCreated, toy);
      put(conveyorBelt, objCreated);
      conveyorBelt.btnOut();
    } else if (objCreated is Toy) {
      int index = table.look().indexWhere((o) => o == "Packaging");
      Packaging packaging = table.takePos(index);

      if (packaging == null) {
        print("There is no packaging on table");
        _handleNoMatch(table, conveyorBelt, objCreated);
        return;
      }

      pack(packaging, objCreated);
      put(conveyorBelt, packaging);
      conveyorBelt.btnOut();
    }
  }

  void _handleNoMatch(Table table, ConveyorBelt conveyorBelt, BaseObject obj) {
    bool isObjPut = put(table, obj);
    if (!isObjPut) {
      put(conveyorBelt, obj);
      conveyorBelt.btnOut();
    }
  }

  @override
  bool operator ==(Object other) => other is Elf && other.nickname == nickname;
}
