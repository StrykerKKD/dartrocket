part of dartrocket;

class MovementSystem {

  StageXL.DisplayObject _gameObject;

  num _accelerationDirection = 0;

  num _destinationX;
  num _destinationY;

  num _smallestDiffX;
  num _smallestDiffY;

  num _currentDiffX;
  num _currentDiffY;

  bool _checkLocation = false;

  static const int _NO_ACCELERATION_DIRECTION = 0;

  static const int _SPEED_UP_DIRECTION = 1;

  static const int _SLOW_DOWN_DIRECTION = -1;

  final StageXL.Vector _zeroVector = new StageXL.Vector.zero();

  StageXL.Vector _mainVelocity = new StageXL.Vector.zero();

  StageXL.Vector _speed = new StageXL.Vector.zero();

  StageXL.Vector _acceleration = new StageXL.Vector.zero();

  DirectionSystem _directionSystem = new DirectionSystem();

//=============================================================================

  void set speed(num speed) {
    _speed = new StageXL.Vector(speed, speed);
  }

  void set acceleration(num acceleration) {
    _acceleration = new StageXL.Vector(acceleration, acceleration);
  }

  /**
   * Horizontal speed of the game object.
   * */
  num get speedX => _speed.x;

  void set speedX(num speed) {
    _speed = new StageXL.Vector(speed, _speed.y);
  }

  /**
   * Vertical speed of the game object.
   * */
  num get speedY => _speed.y;

  void set speedY(num speed) {
    _speed = new StageXL.Vector(_speed.x, speed);
  }

  /**
   * Horizontal acceleration of the game object.
   */
  num get accelerationX => _acceleration.x;

  void set accelerationX(num acc) {
    _acceleration = new StageXL.Vector(acc, _acceleration.y);
  }

  /**
   * Vertical acceleration of the game object.
   */
  num get accelerationY => _acceleration.y;

  void set accelerationY(num acc) {
    _acceleration = new StageXL.Vector(_acceleration.x, acc);
  }

  num maxSpeed = 0;

  num minSpeed = 0;

//=============================================================================

  MovementSystem(this._gameObject);

//=============================================================================

  /**
   * Defines where the game object will move next.
   */
  bool update(num time) {

    _checkSpeedLimits();

    _checkDestination();

    _speed += _acceleration.scale(_accelerationDirection * time);

    addVelocity(_directionSystem.mainDirection * _speed);

    _updatePosition(_mainVelocity.scale(time));

    _nullMainVelocity();

    return true;
  }

//=============================================================================

  /**
   * Adds velocity vector to the game object's main velocity vector.
   */
  void addVelocity(StageXL.Vector velocity) {
    _mainVelocity += velocity;
  }

  /**
   * Moving the game object in a direction.
   *
   * This method uses the [DirectionSystem]'s addToMainDirection method, which means
   * that the input direction will be added to the main direction.
   *
   * This means that opposite directions will to stop the game object movements.
   * It also means that it's easy to make the game object move diagonally and
   * it also make transition between directions better.
   *
   * Diagonal moving: adding together two non-oposite directions make the game object move diagonally.
   * For example: up + left will make the game object move up-left direction.
   *
   * Please use [Direction]'s static members for the input.
   */
  void move(String direction) {
    _directionSystem.addToMainDirection(direction);
  }

  /**
   * Moving the game object in only one direction.
   *
   * This method uses [DirectionSystem]'s setMainDirection method, which means
   * that the main direction will be the input direction.
   *
   * This means instant direction change and opposite directions wont stop the game object and
   * also means that two non-opposite direction wont cause diagonal movement.
   *
   * Please use [Direction]'s static members for the input.
   */
  void moveOneDirection(String direction) {
    _directionSystem.setMainDirection(direction);
  }

  /**
   * Moving the game object to the given coordinate.
   */
  void moveTo(int x, int y) {

    _destinationX = x;
    _destinationY = y;

    _smallestDiffX = null;
    _smallestDiffY = null;

    _checkLocation = true;

    _directionSystem.setMainDirectionFromTo(
        _gameObject.x.round(),
        _gameObject.y.round(),
        _destinationX,
        _destinationY);

  }

  /**
   * Moving the game object by a given distance.
   */
  void moveBy(String direction, {int distance: 5}) {
    StageXL.Vector directionVector = _directionSystem.getDirection(direction);

    moveTo(
        (_gameObject.x + directionVector.x * distance).round(),
        (_gameObject.y + directionVector.y * distance).round());
  }

  /**
   * Stops the movement of the game object.
   */
  void stop() {
    _directionSystem.nullMainDirection();

    _checkLocation = false;
  }

  /**
   * Speed up the game object's movement.
   */
  void speedUP() {
    if (_speedOverEqualMaxSpeed() && _accelerationDirection == 1) {
      _accelerationDirection = _NO_ACCELERATION_DIRECTION;
    } else {
      _accelerationDirection = _SPEED_UP_DIRECTION;
    }
  }

  /**
   * Slows down the game object's movement.
   */
  void slowDown() {
    if (_speedUnderEqualMinSpeed() && _accelerationDirection == -1) {
      _accelerationDirection = _NO_ACCELERATION_DIRECTION;
    } else {
      _accelerationDirection = _SLOW_DOWN_DIRECTION;
    }
  }

  /**
   * Stop the acceleration, both speed up and slow down.
   */
  void stopSpeedChange() {
    _accelerationDirection = _NO_ACCELERATION_DIRECTION;
  }

//=============================================================================

  /**
   * Rotate the game object and it's direction system in radians.
   */
  void rotateRadians(num radians) {
    _gameObject.rotation += radians;
    _directionSystem.rotateDirectionsRadians(radians);
  }

  /**
   * Rotate the game object and it's direction system in angles.
   */
  void rotateAngles(num angles) {
    rotateRadians(angles * (math.PI / 180));
  }

//=============================================================================

  bool _speedOverEqualMaxSpeed() {
    return (_speed.x >= maxSpeed || _speed.y >= maxSpeed);
  }

  bool _speedUnderEqualMinSpeed() {
    return (_speed.x <= minSpeed || _speed.y <= minSpeed);
  }

  void _checkSpeedLimits() {
    if (_speedOverEqualMaxSpeed() && _accelerationDirection == 1) {
      _accelerationDirection = 0;
    }

    if (_speedUnderEqualMinSpeed() && _accelerationDirection == -1) {
      _accelerationDirection = 0;
    }
  }

  void _checkDestination() {
    if (_checkLocation) {

      _currentDiffX = (_gameObject.x - _destinationX).abs();
      _currentDiffY = (_gameObject.y - _destinationY).abs();

      if (_smallestDiffX == null) _smallestDiffX = _currentDiffX + 1;
      if (_smallestDiffY == null) _smallestDiffY = _currentDiffY + 1;


      if (_currentDiffX <= _smallestDiffX && _currentDiffY <= _smallestDiffY) {
        _smallestDiffX = _currentDiffX;
        _smallestDiffY = _currentDiffY;
      } else {
        stop();

        _gameObject.x = _destinationX;
        _gameObject.y = _destinationY;

        _smallestDiffX = null;
        _smallestDiffY = null;

      }
    }
  }

  void _nullMainVelocity() {
    _mainVelocity = _zeroVector;
  }

  void _updatePosition(StageXL.Vector distance) {
    _gameObject.x += distance.x;
    _gameObject.y += distance.y;
  }

}
