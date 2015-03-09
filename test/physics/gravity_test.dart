library gravity_test;

import 'package:unittest/unittest.dart';
import 'package:dartrocket/src/physics.dart' show Gravity, DirectionSystem;
import 'package:dartrocket/src/constant.dart' show Direction;

void main() => defineTest();

void defineTest() {
  group("Gravity Constructor", () {
    Gravity gravity;
    tearDown(() {
      gravity = null;
    });
    test("Positiv speed", () {
      gravity = new Gravity(10);
      expect(gravity.speed, equals(10));
    });
    test("Negativ speed", () {
      gravity = new Gravity(-10);
      expect(gravity.speed, equals(-10));
    });
    test("Zero speed", () {
      gravity = new Gravity(0);
      expect(gravity.speed, equals(0));
    });
    test("Direction System initalized", () {
      gravity = new Gravity(0);
      expect(gravity.directionSystem, new isInstanceOf<DirectionSystem>());
    });
  });
  group("Gravity getVelocity", () {
    Gravity gravity;
    tearDown(() {
      gravity = null;
    });
    test("Speed(0) * main direction(0,0) => (0,0)", () {
      gravity = new Gravity(0);
      testVector(gravity.getVelocity(), 0, 0);
    });
    test("Speed(1) * main direction(0,0) => (0,0)", () {
      gravity = new Gravity(1);
      testVector(gravity.getVelocity(), 0, 0);
    });
    test("Speed(0) + (set every directions) => (0,0)", () {
      gravity = new Gravity(0);
      Direction.DIRECTIONS.forEach((direction) {
        gravity.directionSystem.setMainDirection(direction);
        testVector(gravity.getVelocity(), 0, 0);
      });
    });
    test("Speed(1) + (set every directions) => (x,y)", () {
      gravity = new Gravity(1);
      Direction.DIRECTIONS.forEach((direction) {
        gravity.directionSystem.setMainDirection(direction);
        expect(gravity.getVelocity(),
            equals(gravity.directionSystem.getDirection(direction)));
      });
    });
    test("Speed(2) + (set every directions) => 2*(x,y)", () {
      gravity = new Gravity(2);
      Direction.DIRECTIONS.forEach((direction) {
        gravity.directionSystem.setMainDirection(direction);
        expect(gravity.getVelocity(),
            equals(gravity.directionSystem.getDirection(direction).scale(2)));
      });
    });
    test("Speed(-1) + (set every directions) => -(x,y)", () {
      gravity = new Gravity(-1);
      Direction.DIRECTIONS.forEach((direction) {
        gravity.directionSystem.setMainDirection(direction);
        expect(gravity.getVelocity(),
            equals(gravity.directionSystem.getDirection(direction).negate()));
      });
    });
    test("Speed(-2) + (set every directions) => -2*(x,y)", () {
      gravity = new Gravity(-2);
      Direction.DIRECTIONS.forEach((direction) {
        gravity.directionSystem.setMainDirection(direction);
        expect(gravity.getVelocity(), equals(
            gravity.directionSystem.getDirection(direction).negate().scale(2)));
      });
    });
  });
}

void testVector(vector, x, y) {
  expect(vector.x, x);
  expect(vector.y, y);
}
