import 'package:rush_efrei_klaus/models/furniture/furniture.dart';
import 'package:rush_efrei_klaus/models/object.dart';
import 'package:rush_efrei_klaus/models/packaging/gift_wrap.dart';
import 'package:rush_efrei_klaus/models/packaging/packaging.dart';
import 'package:rush_efrei_klaus/models/toy/toy.dart';
import 'package:rush_efrei_klaus/models/work_station.dart';

class Elf {
  String nickname;
  WorkStation station;

  Elf(this.nickname, this.station);

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

  void btnIn() {
    print('$nickname has pushed IN button');
    station.conveyorBelt.btnIn();
  }

  void btnOut() {
    print('$nickname has pushed OUT button');
    station.conveyorBelt.btnOut();
  }

  void pressInBtnAndPackage() {
    // Press in button of conveyor belt to generate an object
    btnIn();
    switch (station.conveyorBelt.look().first) {
      case 'Packaging':
        int index = station.table.searchIndex('Toy');
        if (index == -1) {
          print('There is no Toy on table');
          _handleNoMatch();
          return;
        }

        Toy toy = station.table.takePos(index);
        Packaging packagingCreated = station.conveyorBelt.take();
        _handleObjectOut(packagingCreated, toy);
        break;
      case 'Toy':
        int index = station.table.searchIndex('Packaging');
        if (index == -1) {
          print('There is no packaging on table');
          _handleNoMatch();
          return;
        }

        Packaging packaging = station.table.takePos(index);
        Toy toyCreated = station.conveyorBelt.take();
        _handleObjectOut(packaging, toyCreated);
        break;
      default:
    }
  }

  void _handleObjectOut(Packaging packaging, Toy toy) {
    pack(packaging, toy);
    put(station.conveyorBelt, packaging);
    btnOut();
  }

  void _handleNoMatch() {
    BaseObject objCreated = station.conveyorBelt.take();
    bool isObjPut = put(station.table, objCreated);
    if (!isObjPut) {
      put(station.conveyorBelt, objCreated);
      btnOut();
    }
  }

  @override
  bool operator ==(Object other) => other is Elf && other.nickname == nickname;
}
