part of spaceinvader;

class Ship extends Sprite {

  bool moving = true;
  bool movingLeft = false;
  bool movingRight = false;

  Ship.textureatlas(stateContext, resourceName, textureAtlasName) :
      super.textureatlas(
      stateContext,
      resourceName,
      textureAtlasName);

  @override
  bool advanceTime(num time) {

    if (!movingRight && movingLeft) {
      x = x - vx * time;
    }
    if (!movingLeft && movingRight) {
      x = x + vx * time;
    }

    return true;
  }

  Timer actualTimer;

  void goLeft() {
    movingLeft = true;
  }

  void stopLeft() {
    movingLeft = false;
  }

  void goRight() {
    movingRight = true;
  }

  void stopRight() {
    movingRight = false;
  }


}
