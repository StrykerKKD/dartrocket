part of spaceinvader;

class Ship extends Sprite {

  bool movingLeft = false;
  bool movingRight = false;

  Ship.textureatlas(stateContext, resourceName, textureAtlasName ) :
      super.textureatlas(stateContext, resourceName, textureAtlasName);

  @override
  bool advanceTime(num time) {

    if (movingLeft && x >= 0) {
      x = x - vx * time;
    } else if (movingRight && x <= context.game.stage.sourceWidth - width) {
      x = x + vx * time;
    }
    return true;
  }
}
