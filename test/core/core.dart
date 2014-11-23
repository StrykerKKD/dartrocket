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
      game.stateManager.addState("idleState", new IdleState());
      game.stateManager.initState("idleState");
      expect(game.stateManager.currentState.name, equals("idleState"));
    });

    test('no transition between two idle state', () {
      game = new Game();
      game.stateManager.addStateMap({
        "idleState1": new IdleState("idleState2"),
        "idleState2": new IdleState()
      });
      game.stateManager.initState("idleState1");
      new Timer(new Duration(milliseconds: 10), () {
        expect(game.stateManager.currentState.name, equals("idleState1"));
        expect(game.stateManager.currentState.name, isNot("idleState2"));
      });
    });

    test('transition from KillState to IdleSatet', () {
      game = new Game();
      game.stateManager.addStateMap({
        "killState": new KillState("idleState"),
        "idleState": new IdleState()
      });
      game.stateManager.initState("killState");
      new Timer(new Duration(milliseconds: 10), () {
        expect(game.stateManager.currentState.name, equals("idleState"));
      });
    });

    test('transition from PauseState to IdleState', () {
      game = new Game();
      game.stateManager.addStateMap({
        "pauseState": new PauseState("idleState"),
        "idleState": new IdleState()
      });
      game.stateManager.initState("pauseState");
      new Timer(new Duration(milliseconds: 10), () {
        expect(game.stateManager.currentState.name, equals("idleState"));
      });
    });

    test('do a complicated transition', () {
      game = new Game();
      game.stateManager.addStateMap({
        "pKState": new PauseAndKillState("pIState"),
        "pIState": new PauseAndIdle("pKState")
      });
      game.stateManager.initState("pKState");
      new Timer(new Duration(milliseconds: 10), () {
        expect(game.stateManager.currentState.name, equals("pIState"));
      });
    });

  });
}
