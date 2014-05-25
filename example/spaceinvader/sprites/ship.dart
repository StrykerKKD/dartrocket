part of spaceinvader;

class Ship extends Sprite {

  bool movingLeft = false;
  bool movingRight = false;

  Ship(context, resourceName) : super(context, resourceName,isMoveAble:true);


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
