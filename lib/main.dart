import 'package:rush_efrei_klaus/models/elf.dart';
import 'package:rush_efrei_klaus/models/packaging/box.dart';
import 'package:rush_efrei_klaus/models/packaging/gift_wrap.dart';
import 'package:rush_efrei_klaus/models/packaging/packaging.dart';
import 'package:rush_efrei_klaus/models/toy/dragonball.dart';
import 'package:rush_efrei_klaus/models/toy/pony.dart';
import 'package:rush_efrei_klaus/models/toy/toy.dart';
import 'package:rush_efrei_klaus/models/work_station.dart';
import 'package:rush_efrei_klaus/socket/socket_util.dart';

void main() async {
  // Step #1
  print('--- STEP #1 ---');

  Pony pony = Pony();
  DragonBall goku = DragonBall(DBHeroes.SANGOKU);

  pony.isMoved();
  goku.isMoved();

  // Step #2
  print('\n--- STEP #2 ---');

  Elf majdi = Elf.workless('makiboto');
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

  majdi.station = WorkStation.create();

  for (var i = 0; i < 10; i++) {
    majdi.pressInBtnAndPackage();
  }

  List<Elf> listElfs = [];

  await SocketUtil.startServer(
    (nickname) {
      print("Elf created from a client !");
      Elf elf = Elf(nickname, WorkStation.create());
      listElfs.add(elf);
    },
  );
}
