part of spaceinvader;

class Ufo extends AnimatedSprite{
  
  Ufo(var bitmapData, {int x, int y, int vy: 30}): super(bitmapData, x: x,
        y: y, vy: vy){
    center();
    alive = true;
  }
  
    
  @override
  bool advanceTime(num time) {
    // TODO: implement advanceTime
    if(y > game.stage.sourceHeight || alive == false){
      game.stage.removeChild(this);
      game.stage.juggler.remove(this);      
    }
    
    y = y + vy * time;
  }
}