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
      testAddToMainDirections(directionSystem, Direction.MAIN_DIRECTIONS, [{
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
      testAddToMainDirections(directionSystem, Direction.DIAGONAL_DIRECTIONS, [{
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

  group("AddToMainDirection", () {});

  group("SetMainDirection", () {});

  group("GetDirection", () {});

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

  group("rotateDirections", () {});

}

void testDirection(direction, x, y) {
  expect(direction.x, equals(x));
  expect(direction.y, equals(y));
}

void testAddToMainDirections(DirectionSystem directionSystem, List directions, List<Map> expectedDirections, bool doNullMainDirection) {
  for (int i = 0; i < directions.length; i++) {
    directionSystem.addToMainDirection(directions[i]);
    testDirection(directionSystem.mainDirection, expectedDirections[i]["x"], expectedDirections[i]["y"]);
    if (doNullMainDirection) directionSystem.nullMainDirection();
  }
}

num _makeRadians(num angles) => angles * (PI / 180);
