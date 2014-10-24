part of dartrocket;

/**
 * Declares a way how to use the [MovementSystem] class.
 */
abstract class MovementControl {

  MovementSystem movementSystem;

//=============================================================================

  /**
   * Horizontal speed of the game object.
   * */
  num get speedX => movementSystem.speedX;

  void set speedX(num speed) {
    movementSystem.speedX = speed;
  }

  /**
   * Vertical speed of the game object
   * */
  num get speedY => movementSystem.speedY;

  void set speedY(num speed) {
    movementSystem.speedY = speed;
  }

  /**
   * Horizontal acceleration of the game object.
   */
  num get accelerationX => movementSystem.accelerationX;

  void set accelerationX(num acc) {
    movementSystem.accelerationX = acc;
  }

  /**
   * Vertical acceleration of the game object.
   */
  num get accelerationY => movementSystem.accelerationY;

  void set accelerationY(num acc) {
    movementSystem.accelerationY = acc;
  }

  /**
   * The maximum speed limit for the game object.
   */
  num get maxSpeed => movementSystem.maxSpeed;

  void set maxSpeed(num speed) {
    movementSystem.maxSpeed = speed;
  }

  /**
   * The minimum speed limit for the game object.
   */
  num get minSpeed => movementSystem.minSpeed;

  void set minSpeed(num speed) {
    movementSystem.minSpeed = speed;
  }

  /**
   * Set the horizontal and vertical speed with the same value.
   */
  void set speed(num speed) {
    movementSystem.speed = speed;
  }

  /**
   * Set the horizontal and vertical acceleration with the same value.
   */
  void set acceleration(num acceleration) {
    movementSystem.acceleration = acceleration;
  }

//=============================================================================

  /**
   * Rotate the game object and it's direction system in radians.
   */
  void rotateRadians(num radians) {
    movementSystem.rotateRadians(radians);
  }

  /**
   * Rotate the game object and it's direction system in angles.
   */
  void rotateAngles(num angles) {
    movementSystem.rotateAngles(angles);
  }

//=============================================================================

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
    movementSystem.move(direction);
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
    movementSystem.moveOneDirection(direction);
  }

  /**
   * Moving the game object by a given distance.
   */
  void moveBy(String direction, {int distance: 5}) {
    movementSystem.moveBy(direction, distance: distance);
  }

  /**
   * Moving the game object to the given coordinate.
   */
  void moveTo(int x, int y) {
    movementSystem.moveTo(x, y);
  }

  /**
   * Stops the movement of the game object.
   */
  void stop() {
    movementSystem.stop();
  }

//=============================================================================

  /**
   * Speed up the game object's movement.
   */
  void speedUP() {
    movementSystem.speedUP();
  }

  /**
   * Slows down the game object's movement.
   */
  void slowDown() {
    movementSystem.slowDown();
  }

  /**
   * Stop the acceleration, both speed up and slow down.
   */
  void stopSpeedChange() {
    movementSystem.stopSpeedChange();
  }

}
