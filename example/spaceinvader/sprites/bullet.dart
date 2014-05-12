part of spaceinvader;

class Bullet extends AnimatedSprite{
  Bullet(var bitmapData, {int x, int y, int vy: 200}): super(bitmapData, x: x,
        y: y, vy: vy){
    center();
  }


  @override
  bool advanceTime(num time) {
    // TODO: implement advanceTime
    if(y <= height/2 || alive==false){
      game.stage.removeChild(this);
      game.stage.juggler.remove(this);
      alive = false;
    }
    y = y - vy * time;
  }
}