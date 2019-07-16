import 'models/packaging/box.dart';
import 'models/packaging/gift_wrap.dart';
import 'models/packaging/packaging.dart';
import 'models/furniture/conveyor_belt.dart';
import 'models/furniture/table.dart';
import 'models/toy/dragonball.dart';
import 'models/toy/pony.dart';
import 'models/toy/toy.dart';
import 'models/elf.dart';

void main() {
  // Step #1
  print('--- STEP #1 ---');

  Pony pony = Pony();
  DragonBall goku = DragonBall(DBHeroes.SANGOKU);

  pony.isMoved();
  goku.isMoved();

  // Step #2
  print('\n--- STEP #2 ---');

  Elf majdi = Elf('makiboto');
  Packaging box = Box();
  majdi.pack(box, goku);
  box.open();
  majdi.pack(box, goku);

  Packaging paper = GiftWrap();
  majdi.pack(paper, pony);
  majdi.pack(paper, pony);

  Toy toy = majdi.unpack(paper);
  print(toy as Pony == pony);
  Toy r = majdi.unpack(paper);
  print(r == null);

  // Step #3
  print('--- STEP #3 ---');

  Table table = Table();
  ConveyorBelt conveyorBelt = ConveyorBelt();

  majdi.put(table, paper);
  majdi.put(table, pony);
  majdi.put(table, box);

  for (var i = 0; i < 10; i++) {
    majdi.pressInBtnAndPackage(table, conveyorBelt);
  }
}
