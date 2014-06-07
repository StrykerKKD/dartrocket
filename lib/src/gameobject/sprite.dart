part of dartrocket;

/**
 * Sprite is the most basic game object.
 * The Sprite is interactive meaning you can use event listeners with it.
 * The Sprite is Animatable, so you can move it around the stage.
 * 
 * There is 2 use case for this class:
 * 
 * 1. You can just make one Sprite object. This is a good way for making simple 
 * Sprite object. For example: bullets
 * 2. You can extend the Sprite class and make your very own Sprite object. It's
 * good for making more complex Sprite objects. For example: player, ufo
 * 
 * Examples:
 *      //First case
 *      Sprite bullet = new Sprite(this,"bullet");
 * 
 *      //Second case
 *      class Ufo extends Sprite{
 *        Ufo(State context, String resourceName) : super(context, resourceName);
 *        
 *        //You can make your own advanceTime method
 *        @override
 *        bool advanceTime(num time) {
 *          //make some more complex movement
 *        }
 *      }
 * You can find more examples about Sprite class in the Space Invader example.
 * */

class Sprite extends InteractiveBitmap implements StageXL.Animatable {

  /**
   * Does the sprite move?
   */
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
   * * addToStage: automatically add the sprite to the stage?
   * * isMoveAble: will the sprite move?
   * 
   * */
  Sprite(State stateContext, String resourceName, {bool addToStage: true, bool
      isMoveAble: true}) : super(stateContext.game.resourceManager.getBitmapData(
      resourceName)) {
    this.isMoveAble = isMoveAble;
    _context = stateContext;
    if (addToStage) {
      this.addToStage();
    }
  }
  /**
   * Controlls how the object is moving.
   * This implementation is good enough for simple sprites.
   * You can make the sprite move with changing the vx or vy value.
   */
  bool advanceTime(num time) {
    if ((x <= 0 || x >= _context.game.stage.sourceWidth) || (y <= 0 || y >=
        _context.game.stage.sourceHeight)) {
      removeFromStage();
    }
    x = x + vx * time;
    y = y + vy * time;
  }
  /**
   * Put the pivot point into the center of the sprite.
   */
  void center() {
    pivotX = bitmapData.width / 2;
    pivotY = bitmapData.height / 2;
  }

  /**
   * Sprite will be added to the stage and to the juggler if the sprite is moveable.
   */
  addToStage() {
    _context.game.stage.addChild(this);
    if (isMoveAble) {
      _context.game.stage.juggler.add(this);
    }
  }

  /**
   * Removes the sprite from the stage and juggler.
   */
  removeFromStage() {
    alive = false;
    _context.game.stage.removeChild(this);
    if (isMoveAble) {
      _context.game.stage.juggler.remove(this);
    }
  }

  /**
   * Gets the context(State) in which the Sprite was created.
   */
  State get context => _context;

}
