part of spaceinvader;

class Ufo extends Sprite {

  bool moveRight = true;
  bool moving = false;
  int deltaX;

  Ufo.textureatlas(stateContext, resourceName, textureAtlasName) :
      super.textureatlas(stateContext, resourceName, textureAtlasName);

  @override
  bool advanceTime(num time) {

    if (y > (game.stage.sourceHeight - height) || alive == false) {
      alive = false;
      removeFromWorld();
    }
    if (!moving) {
      if (moveRight) {
        deltaX = 50;
      } else {
        deltaX = -50;
      }
      moving = true;
      game.stage.juggler.tween(this, 1, TransitionFunction.easeInOutCubic)
          ..animate.x.by(deltaX)
          ..onComplete = () {
            moveRight = !moveRight;
            moving = false;
          };

    }
    y = y + vy * time;
    return true;
  }
}
