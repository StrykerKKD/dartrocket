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
  bool isMovable;

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
   * Create a Sprite object from [StageXL.BitmapData].
   * 
   * * stateContext: context of the State, which this object is in
   * * bitmapData: bitmapdata for the sprite
   * * addToStage: automatically add the sprite to the stage?
   * * isMoveAble: will the sprite move?
   * 
   * */
  Sprite.bitmapdata(State stateContext, StageXL.BitmapData bitmapData, {bool
      addToStage: true, bool isMovable: true}) : super(bitmapData) {
    this.isMovable = isMovable;
    _context = stateContext;
    if (addToStage) {
      this.addToStage();
    }
  }

  /**
   * Create a Sprite object from an image.
   * 
   * * resourceName: name of the resource in the resourcesManager
   */
  Sprite.image(State stateContext, String resourceName, {bool addToStage:
      true, bool isMovable: true}) : this.bitmapdata(stateContext,
      stateContext.game.resourceManager.getBitmapData(resourceName), addToStage:
      addToStage, isMovable: isMovable);
  
  /**
   * Create a Sprite object from an image, which is inside a texture atlas(JSON).
   * 
   * * textureAtlasName: name of the texture atlas in the resourceManager
   * * resourceName: name of the resource in the texture atlas(image name without extension) 
   */
  Sprite.textureatlas(State stateContext, String textureAtlasName, String
      resourceName, {bool addToStage: true, bool isMovable: true}) : this.bitmapdata(
      stateContext, stateContext.game.resourceManager.getTextureAtlas(textureAtlasName
      ).getBitmapData(resourceName), addToStage: addToStage, isMovable: isMovable);
  
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
    if (isMovable) {
      _context.game.stage.juggler.add(this);
    }
  }

  /**
   * Removes the sprite from the stage and juggler.
   */
  removeFromStage() {
    alive = false;
    _context.game.stage.removeChild(this);
    if (isMovable) {
      _context.game.stage.juggler.remove(this);
    }
  }

  /**
   * Gets the context(State) in which the Sprite was created.
   */
  State get context => _context;

}
