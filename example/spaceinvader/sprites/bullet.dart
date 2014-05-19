part of spaceinvader;

class Bullet extends AnimatedSprite {
  Bullet(State context, String resourceName) : super(context, resourceName);

  @override
  bool advanceTime(num time) {
    
    if (y <= height / 2 || alive == false) {
      game.stage.removeChild(this);
      game.stage.juggler.remove(this);
      alive = false;
    }
    y = y - vy * time;
  }
}
