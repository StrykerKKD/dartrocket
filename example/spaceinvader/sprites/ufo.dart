part of spaceinvader;

class Ufo extends Sprite {
  
  bool moveRight = true;
  bool moving = false;
  int deltaX;

  Ufo(State context, String resourceName) : super(context, resourceName);

  @override
  bool advanceTime(num time) {
    
    if (y > (game.stage.sourceHeight - height)  || alive == false) {
      alive = false;
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
      game.stage.juggler.tween(this, 1, game.transitionFunction.easeInOutCubic)
          ..animate.x.by(deltaX)
          ..onComplete = () {
            moveRight = !moveRight;
            moving = false;
          };

    }
    y = y + vy * time;
  }
}
