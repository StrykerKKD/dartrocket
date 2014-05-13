library spaceinvader;

import 'package:dartrocket/dartrocket.dart';
import 'dart:async';

part 'states/loading.dart';
part 'states/menu.dart';
part 'states/play.dart';
part 'states/end.dart';

part 'sprites/ship.dart';
part 'sprites/ufo.dart';
part 'sprites/bullet.dart';


int mainColor = 0xFFC8A1;

Game game;

void main() {

  game = new Game("canvas");

  game.stateManager.addStateMap({
    "loading": new Loading("loading", "menu"),
    "menu": new Menu("menu","play"),
    "play": new Play("play","end"),
    "end": new End("end")
  });
  game.stateManager.initState("loading");
}
