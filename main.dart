import 'models/DragonBall.dart';
import 'models/Pony.dart';

void main() {
  // Step #1
  print("--- STEP #1 ---");

  Pony pony = Pony();
  DragonBall goku = DragonBall(DBHeroes.SANGOKU);

  pony.isMoved();
  goku.isMoved();
}
