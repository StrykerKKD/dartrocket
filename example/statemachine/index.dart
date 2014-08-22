library statemachine;

import 'package:dartrocket/dartrocket.dart';
import 'dart:async';

part "states/first.dart";
part "states/second.dart";
part "states/third.dart";



void main() {
  
  Game game = new Game(color:Color.LightGreen);

  game.stateManager.addStateMap({
    "first": new First("second"),
    "second": new Second("third"),
    "third": new Third()
  });

  game.stateManager.initState("first");
}
