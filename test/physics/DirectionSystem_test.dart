library DirectionSystem_test;

import 'package:unittest/unittest.dart';
import 'package:dartrocket/src/physics.dart';
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
      testAddToMainDirection(directionSystem, Direction.MAIN_DIRECTIONS, [{
          "x": 0,
          "y": -1
        }, {
          "x": 0,
          "y": 1
        }, {
          "x": -1,
          "y": 0
        }, {
          "x": 1,
          "y": 0
        }], true);
    });
    test("Testing diagonal directions", () {
      testAddToMainDirection(directionSystem, Direction.DIAGONAL_DIRECTIONS, [{
          "x": -expectedDiagonalValue,
          "y": -expectedDiagonalValue
        }, {
          "x": expectedDiagonalValue,
          "y": -expectedDiagonalValue
        }, {
          "x": -expectedDiagonalValue,
          "y": expectedDiagonalValue
        }, {
          "x": expectedDiagonalValue,
          "y": expectedDiagonalValue
        }], true);
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

  group("AddToMainDirection combinations", () {

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
      testSetMainDirection(directionSystem, Direction.MAIN_DIRECTIONS, [{
          "x": 0,
          "y": -1
        }, {
          "x": 0,
          "y": 1
        }, {
          "x": -1,
          "y": 0
        }, {
          "x": 1,
          "y": 0
        }]);
    });
    test("Testing diagonal directions", () {
      testSetMainDirection(directionSystem, Direction.DIAGONAL_DIRECTIONS, [{
          "x": -expectedDiagonalValue,
          "y": -expectedDiagonalValue
        }, {
          "x": expectedDiagonalValue,
          "y": -expectedDiagonalValue
        }, {
          "x": -expectedDiagonalValue,
          "y": expectedDiagonalValue
        }, {
          "x": expectedDiagonalValue,
          "y": expectedDiagonalValue
        }]);
    });
  });

  group("GetDirection", () {
    DirectionSystem directionSystem;
    setUp(() {
      directionSystem = new DirectionSystem();
    });
    tearDown(() {
      directionSystem = null;
    });
    test("Get main directions", () {
      testGetDirections(directionSystem, Direction.MAIN_DIRECTIONS, [{
          "x": 0,
          "y": -1
        }, {
          "x": 0,
          "y": 1
        }, {
          "x": -1,
          "y": 0
        }, {
          "x": 1,
          "y": 0
        }]);
    });
    test("Get diagonal directions", () {
      testGetDirections(directionSystem, Direction.DIAGONAL_DIRECTIONS, [{
          "x": -expectedDiagonalValue,
          "y": -expectedDiagonalValue
        }, {
          "x": expectedDiagonalValue,
          "y": -expectedDiagonalValue
        }, {
          "x": -expectedDiagonalValue,
          "y": expectedDiagonalValue
        }, {
          "x": expectedDiagonalValue,
          "y": expectedDiagonalValue
        }]);
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

  group("rotateDirections", () {
    DirectionSystem directionSystem;
    setUp(() {
      directionSystem = new DirectionSystem();
    });
    tearDown(() {
      directionSystem = null;
    });
    test("Rotate 45 angles diagonal directions", () {
      directionSystem.rotateDirectionsAngles(45);
      testDirection(directionSystem.upLeftDirection, -1, 0);
      testDirection(directionSystem.upRightDirection, 1, 0);
      testDirection(directionSystem.downLeftDirection, 0, -1);
      testDirection(directionSystem.downRightDirection, 0, 1);
    });
    test("Rotate 90 angles main directions", () {
      directionSystem.rotateDirectionsAngles(90);
      testDirection(directionSystem.upDirection, 1, 0);
      testDirection(directionSystem.downDirection, -1, 0);
      testDirection(directionSystem.leftDirection, 0, -1);
      testDirection(directionSystem.rightDirection, 0, 1);
    });
  });

}

void testDirection(direction, x, y) {
  expect(direction.x, equals(x));
  expect(direction.y, equals(y));
}

void testDirectionRange(direction, startX, endX, startY, endY) {
  expect(direction.x, inExclusiveRange(startX, endX));
  expect(direction.y, inExclusiveRange(startY, endY));
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

num _makeRadians(num angles) => angles * (PI / 180);
