part of dartrocket.constant;

/**
 * This class contains the contants of every direction.
 */

abstract class Direction {

  static const String UP = "up";
  static const String FORWARD = "forward";

  static const String DOWN = "down";
  static const String BACKWARD = "backward";

  static const String LEFT = "left";

  static const String RIGHT = "right";

//=============================================================================

  static const String UPLEFT = "upleft";

  static const String UPRIGHT = "upright";

  static const String DOWNLEFT = "downleft";

  static const String DOWNRIGHT = "downright";

//=============================================================================

  static List<String> MAIN_DIRECTIONS = [UP,DOWN,LEFT,RIGHT];

  static List<String> DIAGONAL_DIRECTIONS = [UPLEFT,UPRIGHT,DOWNLEFT,DOWNRIGHT];

  static List<String> DIRECTIONS = [UP,DOWN,LEFT,RIGHT,UPLEFT,UPRIGHT,DOWNLEFT,DOWNRIGHT];

}
