library core_test;

import 'package:unittest/unittest.dart';
import 'package:dartrocket/dartrocket.dart';
import 'dart:async';

part 'idlestate.dart';
part 'pausestate.dart';
part 'killstate.dart';
part 'pauseandkillstate.dart';
part 'pauseandidle.dart';

void main() {

  Game game;

  group('statemanager', () {

    test('add and init a state', () {
      game = new Game();
      IdleState idleState = new IdleState("idleState");
      game.stateManager.addState("idleState", idleState);
      game.stateManager.initState("idleState");
      expect(game.stateManager.currentState.name, equals("idleState"));
    });

    test('add 2 state and init a state', () {
      game = new Game();
      IdleState idleState1 = new IdleState("idleState1");
      IdleState idleState2 = new IdleState("idleState2");
      game.stateManager.addState("idleState1", idleState1);
      game.stateManager.initState("idleState1");
      expect(game.stateManager.currentState.name, isNot("idleState2"));
    });

    test('transition from KillState to IdleSatet', () {
      game = new Game();
      game.stateManager.addStateMap({
        "killState": new KillState("killState", "idleState"),
        "idleState": new IdleState("idleState")
      });
      game.stateManager.initState("killState");
      new Timer(new Duration(milliseconds: 100), () {
        expect(game.stateManager.currentState.name, equals("idleState"));
      });
    });

    test('transition from PauseState to IdleState', () {
      game = new Game();
      game.stateManager.addStateMap({
        "pauseState": new PauseState("pauseState", "idleState"),
        "idleState": new IdleState("idleState")
      });
      game.stateManager.initState("pauseState");
      new Timer(new Duration(milliseconds: 100), () {
        expect(game.stateManager.currentState.name, equals("idleState"));
      });
    });

    test('do a complicated transition', () {
      game = new Game();
      game.stateManager.addStateMap({
        "pKState": new PauseAndKillState("pKState", "pIState"),
        "pIState": new PauseAndIdle("pIState", "pKState")
      });
      game.stateManager.initState("pKState");
      new Timer(new Duration(milliseconds: 100), () {
        expect(game.stateManager.currentState.name, equals("pIState"));
      });
    });

  });
}
