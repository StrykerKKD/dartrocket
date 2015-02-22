library DirectionSystem_test;

import 'package:unittest/unittest.dart';
import 'package:dartrocket/src/physics.dart';
import 'dart:math';

void main() => defineTest();

const num SQRT2_2 = SQRT2/2;

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
      testDirection(directionSystem.upLeftDirection, -SQRT2_2, -SQRT2_2);
      testDirection(directionSystem.upRightDirection, SQRT2_2, -SQRT2_2);
      testDirection(directionSystem.downLeftDirection, -SQRT2_2, SQRT2_2);
      testDirection(directionSystem.downRightDirection, SQRT2_2, SQRT2_2);
    });
  });

  group("AddtoMainDirection", (){});

  group("SetMainDirection", (){});

  group("GetDirection", (){});

  group("NullMainDirection", (){});

  group("rotateDirections", (){});

}

void testDirection(direction, x, y) {
  expect(direction.x, equals(x));
  expect(direction.y, equals(y));
}

num _makeRadians(num angles) => angles * (PI / 180);
