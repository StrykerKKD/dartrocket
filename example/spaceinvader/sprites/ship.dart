part of spaceinvader;

class Ship extends Sprite {

  bool movingLeft = false;
  bool movingRight = false;

  Ship(context, resourceName) : super(context, resourceName);
  Ship.textureatlas(stateContext, textureAtlasName, resourceName) :
      super.textureatlas(stateContext, textureAtlasName, resourceName);

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
