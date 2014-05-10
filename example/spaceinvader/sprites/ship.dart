part of spaceinvader;

class Ship extends AnimatedSprite {

  bool movingLeft = false;
  bool movingRight = false;

  Ship(var bitmapData, {int x, int y, int vx: 200}): super(bitmapData, x: x, 
      y: y, vx: vx);


  @override
  bool advanceTime(num time) {
    // TODO: implement advanceTime
    if (movingLeft) {
      x = x - vx * time;
    } else if (movingRight) {
      x = x + vx * time;
    }
    return true;

  }
}
