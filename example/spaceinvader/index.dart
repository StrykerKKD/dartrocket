library spaceinvader;

import 'package:dartrocket/dartrocket.dart';
import 'dart:async';

part 'states/loading.dart';
part 'states/menu.dart';
part 'states/play.dart';
part 'states/end.dart';

part 'sprites/ufo.dart';




Game game;

void main() {

  game = new Game(fullScreen: true);
  
  game.add.defaultResourceMode = GameObjectFactory.TEXTUREATLAS;
  game.add.defaultTextureAtlasName = 'spaceinvader';
  
  game.stateManager.addStateMap({
    "loading": new Loading(),
    "menu": new Menu(),
    "play": new Play(),
    "end": new End()
  });
  game.stateManager.initState("loading");
}
