part of dartrocket;

/**
 * This interface is the most basic object.
 * */

class FullSprite extends InteractiveBitmap implements StageXL.Animatable {

  bool isMoveAble;

  State _context;

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
    _context = stateContext;
    if (addToStage) {
      this.addToStage();
    }
  }

  bool advanceTime(num time) {
    if ((x <= 0 || x >= _context.game.stage.sourceWidth) || 
        (y <= 0 || y >= _context.game.stage.sourceHeight)) {
      removeFromStage();      
    }
    x = x - vx * time;
    y = y - vy * time;
  }

  void center() {
    pivotX = bitmapData.width / 2;
    pivotY = bitmapData.height / 2;
  }

  addToStage() {
    _context.game.stage.addChild(this);
    if (isMoveAble) {
      _context.game.stage.juggler.add(this);
    }
  }

  removeFromStage() {
    alive=false;
    _context.game.stage.removeChild(this);
    if (isMoveAble) {
      _context.game.stage.juggler.remove(this);
    }
  }

}
