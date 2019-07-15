import '../utils.dart';
import 'Figurine.dart';

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

  @override
  void isMoved() => print("Kamé Hamé Ha!");
}
