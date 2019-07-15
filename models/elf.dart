import 'gift_wrap.dart';
import 'packaging.dart';
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

  @override
  bool operator ==(Object other) => other is Elf && other.nickname == nickname;
}
