part of dartrocket;

class DirectionSystem {

  final StageXL.Vector _zeroVector = new StageXL.Vector.zero();

  final StageXL.Vector _zeroOneVector = new StageXL.Vector(0, 1);

  final StageXL.Vector _oneZeroVector = new StageXL.Vector(1, 0);

  static const int _MAX_LENGTH_FOR_MAIN_DIRECTION = 1;

  static const double _MAX_LENGTH_WITH_PRECISION = 1.001;


  StageXL.Vector mainDirection = new StageXL.Vector.zero();

  StageXL.Vector upDirection = new StageXL.Vector(0, -1);
  StageXL.Vector downDirection = new StageXL.Vector(0, 1);
  StageXL.Vector leftDirection = new StageXL.Vector(-1, 0);
  StageXL.Vector rightDirection = new StageXL.Vector(1, 0);


  /**
   * Add a direction to the main direction vector.
   *
   * Direction can be: up/forward, down/backward, left, right
   */
  void addToMainDirection(String direction) {

    switch (direction) {
      case Direction.UP:
      case Direction.FORWARD:
        mainDirection += upDirection;
        break;
      case Direction.DOWN:
      case Direction.BACKWARD:
        mainDirection += downDirection;
        break;
      case Direction.LEFT:
        mainDirection += leftDirection;
        break;
      case Direction.RIGHT:
        mainDirection += rightDirection;
        break;
    }

    if (mainDirection.length > _MAX_LENGTH_WITH_PRECISION) {
      mainDirection = mainDirection.scaleLength(_MAX_LENGTH_FOR_MAIN_DIRECTION);
    }

  }

  /**
   * Sets the main direction vector.
   * 
   * Direction can be: up/forward, down/backward, left, right
   */
  void setMainDirection(String direction) {
    switch (direction) {
      case Direction.UP:
      case Direction.FORWARD:
        mainDirection = upDirection;
        break;
      case Direction.DOWN:
      case Direction.BACKWARD:
        mainDirection = downDirection;
        break;
      case Direction.LEFT:
        mainDirection = leftDirection;
        break;
      case Direction.RIGHT:
        mainDirection = rightDirection;
        break;
    }
  }

  /**
   * Set the main direction to zero vector.
   */
  void nullMainDirection() {
    if (!mainDirection.isZero) mainDirection = _zeroVector;
  }
  
  /**
   * Set the main direction's x component to zero.
   */
  void nullMainDirectionX() {
    mainDirection *= _zeroOneVector;
  }
  
  /**
   * Set the main direction's y component to zero.
   */
  void nullMainDirectionY() {
    mainDirection *= _oneZeroVector;
  }

  /**
   * Rotate direction vectors(main, up, down, left, right) in radians.
   */
  void rotateDirectionsRadians(num radians) {
    mainDirection = mainDirection.rotate(radians);
    upDirection = upDirection.rotate(radians);
    downDirection = downDirection.rotate(radians);
    leftDirection = leftDirection.rotate(radians);
    rightDirection = rightDirection.rotate(radians);
  }

  /**
   * Rotate direction vectors(main, up, down, left, right) in angles.
   */
  void rotateDirectionsAngles(num angles) {
    rotateDirectionsRadians(angles * (math.PI / 180));
  }
}
