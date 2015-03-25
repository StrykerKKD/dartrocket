library test.core;

import 'package:unittest/unittest.dart';
import 'dart:html' show CanvasElement;

//=============================================================================

import 'package:stagexl/stagexl.dart' as StageXL;
import 'package:dartrocket/src/core.dart';
import 'package:dartrocket/src/physics.dart' show PhysicsSystem;
import 'package:dartrocket/src/input.dart';

//=============================================================================

part 'game_test.dart';
part 'world_test.dart';

//=============================================================================

void main() {
  gameTest();
  worldTest();
}