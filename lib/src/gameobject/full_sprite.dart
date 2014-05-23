part of dartrocket;

/**
 * This interface is the most basic object.
 * */

class FullSprite extends InteractiveBitmap implements StageXL.Animatable {

  bool isMoveAble;

  /**
   * Is the sprite alive?
   * */
  bool alive = false;

  /**
   * Horizontal speed of the sprite.
   * */
  num vx = 0;

  /**
   * Vertical speed of the sprite
   * */
  num vy = 0;

  /**
   * Creates a Sprite object.
   * 
   * * stateContext: context of the State, which this object is in
   * * resourceName: name of the resource for the sprite
   * 
   * */
  FullSprite(State stateContext, String resourceName, {bool addToStage:
      true, bool isMoveAble: false}) : super(
      stateContext.game.resourceManager.getBitmapData(resourceName)) {
    this.isMoveAble = isMoveAble;
    if(addToStage){
      this.addToStage(stateContext);
    }
  }

  bool advanceTime(num time) {
    x = x - vx * time;
    y = y - vy * time;
  }

  void center() {
    pivotX = bitmapData.width / 2;
    pivotY = bitmapData.height / 2;
  }

  addToStage(State context) {
    context.game.stage.addChild(this);
    if (isMoveAble) {
      context.game.stage.juggler.add(this);
    }
  }
  
  killSprite(State context){
    context.game.stage.removeChild(this);
    if(isMoveAble){
      context.game.stage.juggler.remove(this);
    }
  }

}
