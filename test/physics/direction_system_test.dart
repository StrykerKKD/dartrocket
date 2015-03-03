library direction_system_test;

import 'package:unittest/unittest.dart';
import 'package:dartrocket/src/physics.dart' show DirectionSystem;
import 'package:dartrocket/src/constant.dart' show Direction;
import 'dart:math';

void main() => defineTest();

//Calculated with Wolfram Alpha: http://www.wolframalpha.com/input/?i=sqrt%282%29%2F2
const expectedDiagonalValue = 0.7071067811865475244008443621048490392848359376884740;

void defineTest() {

  group("Constructor Test", () {
    DirectionSystem directionSystem;
    setUp(() {
      directionSystem = new DirectionSystem();
    });
    tearDown(() {
      directionSystem = null;
    });
    test("Default main direction", () {
      testDirection(directionSystem.mainDirection, 0, 0);
    });
    test("Default main directions", () {
      testDirection(directionSystem.upDirection, 0, -1);
      testDirection(directionSystem.downDirection, 0, 1);
      testDirection(directionSystem.leftDirection, -1, 0);
      testDirection(directionSystem.rightDirection, 1, 0);
    });
    test("Default diagonal directions", () {
      testDirection(directionSystem.upLeftDirection, -expectedDiagonalValue, -expectedDiagonalValue);
      testDirection(directionSystem.upRightDirection, expectedDiagonalValue, -expectedDiagonalValue);
      testDirection(directionSystem.downLeftDirection, -expectedDiagonalValue, expectedDiagonalValue);
      testDirection(directionSystem.downRightDirection, expectedDiagonalValue, expectedDiagonalValue);
    });
  });

  group("AddToMainDirection with nullMainDirection", () {
    DirectionSystem directionSystem;
    setUp(() {
      directionSystem = new DirectionSystem();
    });
    tearDown(() {
      directionSystem = null;
    });
    test("Testing main directions", () {
      testAddToMainDirection(directionSystem, Direction.MAIN_DIRECTIONS,
          [{"x": 0,"y": -1}, {"x": 0,"y": 1},
           {"x": -1,"y": 0}, {"x": 1,"y": 0}], true);
    });
    test("Testing diagonal directions", () {
      testAddToMainDirection(directionSystem, Direction.DIAGONAL_DIRECTIONS,
          [{"x": -expectedDiagonalValue,"y": -expectedDiagonalValue},
           {"x": expectedDiagonalValue,"y": -expectedDiagonalValue},
           {"x": -expectedDiagonalValue,"y": expectedDiagonalValue},
           {"x": expectedDiagonalValue,"y": expectedDiagonalValue}], true);
    });
  });

  group("Null main direction by addToMainDirection", () {
    DirectionSystem directionSystem;
    setUp(() {
      directionSystem = new DirectionSystem();
    });
    tearDown(() {
      directionSystem = null;
    });
    test("Null direction by adding together 2 main direction", () {
      directionSystem.addToMainDirection(Direction.UP);
      directionSystem.addToMainDirection(Direction.DOWN);
      testDirection(directionSystem.mainDirection, 0, 0);
      directionSystem.addToMainDirection(Direction.LEFT);
      directionSystem.addToMainDirection(Direction.RIGHT);
      testDirection(directionSystem.mainDirection, 0, 0);
    });
    test("Null direction by adding together 2 diagonal direction", () {
      directionSystem.addToMainDirection(Direction.UPLEFT);
      directionSystem.addToMainDirection(Direction.DOWNRIGHT);
      testDirection(directionSystem.mainDirection, 0, 0);
      directionSystem.addToMainDirection(Direction.UPRIGHT);
      directionSystem.addToMainDirection(Direction.DOWNLEFT);
      testDirection(directionSystem.mainDirection, 0, 0);
    });
  });

  group("AddToMainDirection 2 direction combinations", () {
    DirectionSystem directionSystem;
    setUp(() {
      directionSystem = new DirectionSystem();
    });
    tearDown(() {
      directionSystem = null;
    });
    test("Diagonal with 2 direction UP+LEFT", () {
      directionSystem.addToMainDirection(Direction.UP);
      directionSystem.addToMainDirection(Direction.LEFT);
      testDirectionRange(directionSystem.mainDirection, -expectedDiagonalValue - 0.0001, -expectedDiagonalValue + 0.0001,
        -expectedDiagonalValue - 0.0001, -expectedDiagonalValue + 0.0001);
    });
    test("Diagonal with 2 direction UP+RIGHT", () {
      directionSystem.addToMainDirection(Direction.UP);
      directionSystem.addToMainDirection(Direction.RIGHT);
      testDirectionRange(directionSystem.mainDirection, expectedDiagonalValue - 0.0001, expectedDiagonalValue + 0.0001,
        -expectedDiagonalValue - 0.0001, -expectedDiagonalValue + 0.0001);
    });
    test("Diagonal with 2 direction DOWN+LEFT", () {
      directionSystem.addToMainDirection(Direction.DOWN);
      directionSystem.addToMainDirection(Direction.LEFT);
      testDirectionRange(directionSystem.mainDirection, -expectedDiagonalValue - 0.0001, -expectedDiagonalValue + 0.0001,
        expectedDiagonalValue - 0.0001, expectedDiagonalValue + 0.0001);
    });
    test("Diagonal with 2 direction DOWN+RIGHT", () {
      directionSystem.addToMainDirection(Direction.DOWN);
      directionSystem.addToMainDirection(Direction.RIGHT);
      testDirectionRange(directionSystem.mainDirection, expectedDiagonalValue - 0.0001, expectedDiagonalValue + 0.0001,
        expectedDiagonalValue - 0.0001, expectedDiagonalValue + 0.0001);
    });
    test("Diagonal with 2 direction UPLEFT+DOWNLEFT", () {
      directionSystem.addToMainDirection(Direction.UPLEFT);
      directionSystem.addToMainDirection(Direction.DOWNLEFT);
      testDirection(directionSystem.mainDirection, -1, 0);
    });
    test("Diagonal with 2 direction UPRIGHT+DOWNRIGHT", () {
      directionSystem.addToMainDirection(Direction.UPRIGHT);
      directionSystem.addToMainDirection(Direction.DOWNRIGHT);
      testDirection(directionSystem.mainDirection, 1, 0);
    });
    test("Diagonal with 2 direction UPLEFT+UPRIGHT", () {
      directionSystem.addToMainDirection(Direction.UPLEFT);
      directionSystem.addToMainDirection(Direction.UPRIGHT);
      testDirection(directionSystem.mainDirection, 0, -1);
    });
    test("Diagonal with 2 direction DOWNLEFT+DOWNRIGHT", () {
      directionSystem.addToMainDirection(Direction.DOWNLEFT);
      directionSystem.addToMainDirection(Direction.DOWNRIGHT);
      testDirection(directionSystem.mainDirection, 0, 1);
    });
  });

  group("SetMainDirection", () {
    DirectionSystem directionSystem;
    setUp(() {
      directionSystem = new DirectionSystem();
    });
    tearDown(() {
      directionSystem = null;
    });
    test("Testing diagonal directions", () {
      testSetMainDirection(directionSystem, Direction.MAIN_DIRECTIONS,
          [{"x": 0,"y": -1}, {"x": 0,"y": 1},
           {"x": -1,"y": 0}, {"x": 1,"y": 0}]);
    });
    test("Testing diagonal directions", () {
      testSetMainDirection(directionSystem, Direction.DIAGONAL_DIRECTIONS,
          [{"x": -expectedDiagonalValue,"y": -expectedDiagonalValue},
           {"x": expectedDiagonalValue,"y": -expectedDiagonalValue},
           {"x": -expectedDiagonalValue,"y": expectedDiagonalValue},
           {"x": expectedDiagonalValue,"y": expectedDiagonalValue}]);
    });
  });

  group("SetMainDirectionFromTo", () {});

  group("GetDirection", () {
    DirectionSystem directionSystem;
    setUp(() {
      directionSystem = new DirectionSystem();
    });
    tearDown(() {
      directionSystem = null;
    });
    test("Get main directions", () {
      testGetDirections(directionSystem, Direction.MAIN_DIRECTIONS,
          [{"x": 0,"y": -1}, {"x": 0,"y": 1},
           {"x": -1,"y": 0}, {"x": 1,"y": 0}]);
    });
    test("Get diagonal directions", () {
      testGetDirections(directionSystem, Direction.DIAGONAL_DIRECTIONS,
          [{"x": -expectedDiagonalValue,"y": -expectedDiagonalValue},
           {"x": expectedDiagonalValue,"y": -expectedDiagonalValue},
           {"x": -expectedDiagonalValue,"y": expectedDiagonalValue},
           {"x": expectedDiagonalValue,"y": expectedDiagonalValue}]);
    });
  });

  group("NullMainDirection", () {
    DirectionSystem directionSystem;
    setUp(() {
      directionSystem = new DirectionSystem();
    });
    tearDown(() {
      directionSystem = null;
    });
    test("Testing null", () {
      directionSystem.addToMainDirection(Direction.DOWNRIGHT);
      directionSystem.nullMainDirection();
      testDirection(directionSystem.mainDirection, 0, 0);
    });
    test("Testing nullX", () {
      directionSystem.addToMainDirection(Direction.DOWNRIGHT);
      directionSystem.nullMainDirectionX();
      testDirection(directionSystem.mainDirection, 0, expectedDiagonalValue);
    });
    test("Testing nullY", () {
      directionSystem.addToMainDirection(Direction.DOWNRIGHT);
      directionSystem.nullMainDirectionY();
      testDirection(directionSystem.mainDirection, expectedDiagonalValue, 0);
    });
  });

  group("RotateDirections", () {
    DirectionSystem directionSystem;
    setUp(() {
      directionSystem = new DirectionSystem();
    });
    tearDown(() {
      directionSystem = null;
    });
    test("Rotate 45 angles diagonal directions", () {
      directionSystem.rotateDirectionsAngles(45);
      testDirectionRange(directionSystem.upLeftDirection, -0.0001, 0.0001, -1, -1);
      testDirectionRange(directionSystem.upRightDirection, 1, 1, -0.0001, 0.0001);
      testDirectionRange(directionSystem.downLeftDirection, -1, -1, -0.0001, 0.0001);
      testDirectionRange(directionSystem.downRightDirection, -0.0001, 0.0001, 1, 1);
    });
    test("Rotate PI/4 radians diagonal directions", () {
      directionSystem.rotateDirectionsRadians(PI/4);
      testDirectionRange(directionSystem.upLeftDirection, -0.0001, 0.0001, -1, -1);
      testDirectionRange(directionSystem.upRightDirection, 1, 1, -0.0001, 0.0001);
      testDirectionRange(directionSystem.downLeftDirection, -1, -1, -0.0001, 0.0001);
      testDirectionRange(directionSystem.downRightDirection, -0.0001, 0.0001, 1, 1);
    });
    test("Rotate 90 angles main directions", () {
      directionSystem.rotateDirectionsAngles(90);
      testDirectionRange(directionSystem.upDirection, 1, 1, -0.0001, 0.0001);
      testDirectionRange(directionSystem.downDirection, -1, -1, -0.0001, 0.0001);
      testDirectionRange(directionSystem.leftDirection, -0.0001, 0.0001, -1, -1);
      testDirectionRange(directionSystem.rightDirection, -0.0001, 0.0001, 1, 1);
    });
    test("Rotate PI/2 radians main direction", () {
      directionSystem.rotateDirectionsRadians(PI/2);
      testDirectionRange(directionSystem.upDirection, 1, 1, -0.0001, 0.0001);
      testDirectionRange(directionSystem.downDirection, -1, -1, -0.0001, 0.0001);
      testDirectionRange(directionSystem.leftDirection, -0.0001, 0.0001, -1, -1);
      testDirectionRange(directionSystem.rightDirection, -0.0001, 0.0001, 1, 1);
    });
  });

  group("Bad input", () {
    DirectionSystem directionSystem;
    setUp(() {
      directionSystem = new DirectionSystem();
    });
    tearDown(() {
      directionSystem = null;
    });
    test("AddToMainDirection", () {
      expect(()=>directionSystem.addToMainDirection(Direction.UP.toUpperCase()), throwsArgumentError);
      expect(()=>directionSystem.addToMainDirection("Up"), throwsArgumentError);
      expect(()=>directionSystem.addToMainDirection("uP"), throwsArgumentError);
      expect(()=>directionSystem.addToMainDirection("${Direction.UP} "), throwsArgumentError);
      expect(()=>directionSystem.addToMainDirection(" ${Direction.UP}"), throwsArgumentError);
    });
    test("SetMainDirection", () {
      expect(()=>directionSystem.setMainDirection(Direction.UP.toUpperCase()), throwsArgumentError);
      expect(()=>directionSystem.setMainDirection("Up"), throwsArgumentError);
      expect(()=>directionSystem.setMainDirection("uP"), throwsArgumentError);
      expect(()=>directionSystem.setMainDirection("${Direction.UP} "), throwsArgumentError);
      expect(()=>directionSystem.setMainDirection(" ${Direction.UP}"), throwsArgumentError);
    });
    test("GetDirection", () {
      expect(()=>directionSystem.getDirection(Direction.UP.toUpperCase()), throwsArgumentError);
      expect(()=>directionSystem.getDirection("Up"), throwsArgumentError);
      expect(()=>directionSystem.getDirection("uP"), throwsArgumentError);
      expect(()=>directionSystem.getDirection("${Direction.UP} "), throwsArgumentError);
      expect(()=>directionSystem.getDirection(" ${Direction.UP}"), throwsArgumentError);
    });
  });

}

//=============================================================================

void testDirection(direction, x, y) {
  expect(direction.x, equals(x));
  expect(direction.y, equals(y));
}

void testDirectionRange(direction, startX, endX, startY, endY) {
  expect(direction.x, inInclusiveRange(startX, endX));
  expect(direction.y, inInclusiveRange(startY, endY));
}

void testAddToMainDirection(DirectionSystem directionSystem, List directions, List<Map> expectedDirections, bool doNullMainDirection) {
  for (int i = 0; i < directions.length; i++) {
    directionSystem.addToMainDirection(directions[i]);
    testDirection(directionSystem.mainDirection, expectedDirections[i]["x"], expectedDirections[i]["y"]);
    if (doNullMainDirection) directionSystem.nullMainDirection();
  }
}

void testSetMainDirection(DirectionSystem directionSystem, List directions, List<Map> expectedDirections) {
  for (int i = 0; i < directions.length; i++) {
    directionSystem.setMainDirection(directions[i]);
    testDirection(directionSystem.mainDirection, expectedDirections[i]["x"], expectedDirections[i]["y"]);
  }
}

void testGetDirections(DirectionSystem directionSystem, List directions, List<Map> expectedDirections) {
  for (int i = 0; i < directions.length; i++) {
    testDirection(directionSystem.getDirection(directions[i]), expectedDirections[i]["x"], expectedDirections[i]["y"]);
  }
}