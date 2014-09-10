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

  StageXL.Vector upLeftDirection;
  StageXL.Vector upRightDirection;

  StageXL.Vector downLeftDirection;
  StageXL.Vector downRightDirection;

  DirectionSystem() {
    upLeftDirection = upDirection.rotate(_makeRadians(-45));
    upRightDirection = upDirection.rotate(_makeRadians(45));

    downLeftDirection = downDirection.rotate(_makeRadians(45));
    downRightDirection = downDirection.rotate(_makeRadians(-45));
  }

  /**
   * Add a direction to the main direction.
   *
   * The method add another direction vector to the main direction and
   * it will scale down the main direction if the main direction vector's langth is bigger then 1.
   * In another world the main direction will stay as an unit vector.
   *
   * Direction can be: up/forward, down/backward, left, right, upleft, upright, downleft, downright
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

      case Direction.UPLEFT:
        mainDirection += upLeftDirection;
        break;
      case Direction.UPRIGHT:
        mainDirection += upRightDirection;
        break;
      case Direction.DOWNLEFT:
        mainDirection += downLeftDirection;
        break;
      case Direction.DOWNRIGHT:
        mainDirection += downRightDirection;
        break;
    }

    if (mainDirection.length > _MAX_LENGTH_WITH_PRECISION) {
      mainDirection = mainDirection.scaleLength(_MAX_LENGTH_FOR_MAIN_DIRECTION);
    }

  }

  /**
   * Sets the main direction vector.
   *
   * Direction can be: up/forward, down/backward, left, right, upleft, upright, downleft, downright
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

      case Direction.UPLEFT:
        mainDirection = upLeftDirection;
        break;
      case Direction.UPRIGHT:
        mainDirection = upRightDirection;
        break;
      case Direction.DOWNLEFT:
        mainDirection = downLeftDirection;
        break;
      case Direction.DOWNRIGHT:
        mainDirection = downRightDirection;
        break;
    }
  }

  /**
   * Sets the main direction based on two coordinates.
   */
  void setMainDirectionFromTo(int fromX, int fromY, int toX, int toY){
    mainDirection = new StageXL.Vector(toX - fromX, toY - fromY).scaleLength(_MAX_LENGTH_FOR_MAIN_DIRECTION);
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
   * Rotate direction vectors(main, up, down, left, right, upleft, upright, downleft, downright) in radians.
   */
  void rotateDirectionsRadians(num radians) {
    mainDirection = mainDirection.rotate(radians);

    upDirection = upDirection.rotate(radians);
    downDirection = downDirection.rotate(radians);
    leftDirection = leftDirection.rotate(radians);
    rightDirection = rightDirection.rotate(radians);

    upLeftDirection = upLeftDirection.rotate(radians);
    upRightDirection = upRightDirection.rotate(radians);
    downLeftDirection = downLeftDirection.rotate(radians);
    downRightDirection = downRightDirection.rotate(radians);
  }

  /**
   * Rotate direction vectors(main, up, down, left, right, upleft, upright, downleft, downright) in angles.
   */
  void rotateDirectionsAngles(num angles) {
    rotateDirectionsRadians(_makeRadians(angles));
  }

  num _makeRadians(num angles) => angles * (math.PI / 180);
}
