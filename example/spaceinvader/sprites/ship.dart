part of spaceinvader;

class Ship extends FullSprite {

  bool movingLeft = false;
  bool movingRight = false;

  Ship(context, resourceName) : super(context, resourceName);


  @override
  bool advanceTime(num time) {
    
    if (movingLeft) {
      x = x - vx * time;
    } else if (movingRight) {
      x = x + vx * time;
    }
    return true;
  }
}
