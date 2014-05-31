library statemachine;

import 'package:dartrocket/dartrocket.dart';
import 'dart:async';

part "states/first.dart";
part "states/second.dart";
part "states/third.dart";



void main() {

  int mainColor = 0x7AA241;
  
  Game game = new Game("canvas",color:mainColor);

  game.stateManager.addStateMap({
    "first": new First("first", "second"),
    "second": new Second("second", "third"),
    "third": new Third("third")
  });

  game.stateManager.initState("first");
}
