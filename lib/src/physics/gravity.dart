part of dartrocket;

class Gravity {

  /**
   * Speed of gravity.
   */
  int speed = 0;

  /**
   * Gravity's [DirectionSystem].
   */
  DirectionSystem directionSystem = new DirectionSystem();

  Gravity(this.speed);

  /**
   * Set the gravity's direction.
   * 
   * Direction can be: up/forward, down/backward, left, right
   */
  void setDirection(String direction) {
    directionSystem.setMainDirection(direction);
  }

  /**
   * Set the gravity's direction to zero vector.
   * 
   * This means the gravity wont have a direction and this means there will be no gravity.
   */
  void nullDirection() {
    directionSystem.nullMainDirection();
  }

  /**
   * Rotate gravity direction vectors(main, up, down, left, right) in angles.
   */
  void rotateDirectionsAngles(num angles) {
    rotateDirectionsRads(angles * (math.PI / 180));
  }

  /**
   * Rotate gravity direction vectors(main, up, down, left, right) in radians.
   */
  void rotateDirectionsRads(num radians) {
    directionSystem.rotateDirectionsRadians(radians);
  }
  
  StageXL.Vector getVelocity() {
    return directionSystem.mainDirection.scale(speed);
  }
}
