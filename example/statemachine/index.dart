library statemachine;

import 'package:dartrocket/dartrocket.dart';
import 'dart:async';

part "states/first.dart";
part "states/second.dart";
part "states/third.dart";

int mainColor = 0x7AA241;

void main() {

  Game game = new Game("canvas");

  game.stateManager.addStateMap({
    "first": new First("first", "second"),
    "second": new Second("second", "third"),
    "third": new Third("third")
  });

  game.stateManager.initState("first");
}
