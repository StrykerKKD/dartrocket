library gravity;

import 'package:dartrocket/dartrocket.dart';

part 'play.dart';

void main() {
  Game game = new Game();
  
  game.stateManager.addState("play", new Play());
  
  game.stateManager.initState("play");
}