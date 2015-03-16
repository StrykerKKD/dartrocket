part of dartrocket.constant;

/**
 * This class contains the constants of every direction.
 */

abstract class Direction {

  static const String UP = "up";
  static const String FORWARD = "forward";

  static const String DOWN = "down";
  static const String BACKWARD = "backward";

  static const String LEFT = "left";

  static const String RIGHT = "right";

//=============================================================================

  static const String UP_LEFT = "upLeft";

  static const String UP_RIGHT = "upRight";

  static const String DOWN_LEFT = "downLeft";

  static const String DOWN_RIGHT = "downRight";

//=============================================================================

  static List<String> MAIN_DIRECTIONS = [UP,DOWN,LEFT,RIGHT];

  static List<String> DIAGONAL_DIRECTIONS = [UP_LEFT,UP_RIGHT,DOWN_LEFT,DOWN_RIGHT];

  static List<String> DIRECTIONS = [UP,DOWN,LEFT,RIGHT,UP_LEFT,UP_RIGHT,DOWN_LEFT,DOWN_RIGHT];

}
