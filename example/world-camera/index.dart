library worldcamera;

import 'package:dartrocket/dartrocket.dart';

part 'play.dart';

void main(){
  Game game = new Game();
  
  game.world.width = 1920;
  
  game.world.height = 1200;
  
  game.stateManager.addState('play', new Play('play'));
  
  game.stateManager.initState('play');
}