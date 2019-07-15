import '../utils.dart';
import 'Toy.dart';

class Pony extends Toy {
  static int _nb = 1;
  int id;

  Pony() : super("Pony #${Pony._nb}") {
    id = Pony._nb;
    Pony._nb++;

    multiPrint([
      "$type is singing -->",
      "Dou-double poney, j’fais izi money",
      "D’où tu m’connais ? Parle moi en billets violets",
      "Dou-double poney, j’fais izi money",
    ]);
  }

  @override
  void isMoved() => print("Huuuuuuhu!");
}