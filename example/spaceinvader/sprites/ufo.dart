part of spaceinvader;

class Ufo extends AnimatedSprite {

  bool moveRight = true;
  bool moving = false;
  int deltaX;

  Ufo(var bitmapData, {int x, int y, int vy: 30}): super(bitmapData, x: x, y: y,
      vy: vy) {
    center();
    alive = true;
  }


  @override
  bool advanceTime(num time) {
    // TODO: implement advanceTime
    if (y > game.stage.sourceHeight || alive == false) {
      game.stage.removeChild(this);
      game.stage.juggler.remove(this);
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
  }
}
