import 'dart:math';

import '../utils.dart';
import 'figurine.dart';

enum DBHeroes { SANGOKU, BEJITA, BEERUS, KAMESENNIN }

String dBHeroesToString(DBHeroes d) => '$d'.split('.').last;

class DragonBall extends Figurine {
  DBHeroes _character;

  DragonBall(this._character)
      : super("Dragon Ball figurine ${dBHeroesToString(_character)}") {
    multiPrint([
      "${dBHeroesToString(_character)} is singing -->",
      "CHA-LA HEAD CHA-LA",
      "Nani ga okite mo kibun wa heno-heno kappa",
      "CHA-LA HEAD CHA-LA",
      "Mune ga pachi-pachi suru hodo",
      "Sawagu Genki-Dama --Sparking !",
    ]);
  }

  factory DragonBall.random() {
    int rand = Random().nextInt(4);
    if (rand == 0) return DragonBall(DBHeroes.SANGOKU);
    if (rand == 1) return DragonBall(DBHeroes.BEJITA);
    if (rand == 2) return DragonBall(DBHeroes.BEERUS);
    return DragonBall(DBHeroes.KAMESENNIN);
  }

  @override
  void isMoved() => print("Kamé Hamé Ha!");

  @override
  bool operator ==(Object other) =>
      other is DragonBall && other._character == _character;
}
