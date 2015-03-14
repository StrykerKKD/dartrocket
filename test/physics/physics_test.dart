library test.physics;

import 'package:unittest/unittest.dart';
import 'dart:math' show PI;

//=============================================================================

import 'package:dartrocket/src/physics.dart';
import 'package:dartrocket/src/constant.dart' show Direction;

//=============================================================================

part 'direction_system_test.dart';
part 'gravity_test.dart';

//=============================================================================

void main() {
  directionSystemTest();
  gravityTest;
}