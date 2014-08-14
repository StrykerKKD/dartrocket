library mygame;

import 'package:dartrocket/dartrocket.dart';

part 'play.dart';

void main() {
  Game game = new Game();
  
  game.stateManager.addState('play', new Play('play'));
  
  game.stateManager.initState('play');
}


