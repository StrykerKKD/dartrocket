part of spaceinvader;

class Ship extends Sprite {

  bool moveLeft = false;
  bool moveRight = false;
  int dirLeft = -1;
  int dirRight = 1;
  int xDir = 0;

  Ship.textureatlas(stateContext, resourceName, textureAtlasName) :
      super.textureatlas(
      stateContext,
      resourceName,
      textureAtlasName);

  @override
  bool advanceTime(num time) {

    /*if (!movingRight && movingLeft) {
      x = x - vx * time;
    } 
    if (!movingLeft && movingRight) {
      x = x + vx * time;
    }*/
    
    if (moveLeft) {
      xDir += dirLeft;
    }
    if (moveRight) {
      xDir += dirRight;
    }
    x = x + xDir * vx * time;
    xDir = 0;
    
    return true;
  }

}
