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

  State _context;

  /**
     * Does the sprite move?
     */
  bool isMovable;

  /**
   * Is the sprite alive?
   * */
  bool alive = false;

  /**
   * Horizontal speed of the sprite.
   * */
  num speedX = 0;

  /**
   * Vertical speed of the sprite
   * */
  num speedY = 0;

  StageXL.Vector mainDirection = new StageXL.Vector.zero();

  StageXL.Vector upDirection = new StageXL.Vector(0, -1);
  StageXL.Vector downDirection = new StageXL.Vector(0, 1);
  StageXL.Vector leftDirection = new StageXL.Vector(-1, 0);
  StageXL.Vector rightDirection = new StageXL.Vector(1, 0);
  
  //TODO: add it into move() and rotate this too when the sprite is rotated
  StageXL.Rectangle maxArea = new StageXL.Rectangle(-1, -1, 2, 2);


  /**
   * Create a Sprite object from [StageXL.BitmapData].
   * 
   * * stateContext: context of the State, which this object is in
   * * bitmapData: bitmapdata for the sprite
   * * addToStage: automatically add the sprite to the stage?
   * * isMoveAble: will the sprite move?
   * 
   * */
  Sprite.bitmapdata(State stateContext, StageXL.BitmapData bitmapData,
      {bool addToWorld: true, bool isMovable: true}) : super(
      bitmapData) {
    this.isMovable = isMovable;
    _context = stateContext;
    if (addToWorld) {
      this.addToWorld();
    }
  }

  /**
   * Create a Sprite object from an image.
   * 
   * * resourceName: name of the image in the resourcesManager
   */
  Sprite.image(State stateContext, String resourceName, {bool addToWorld: true,
      bool isMovable: true})
      : this.bitmapdata(
          stateContext,
          stateContext.game.resourceManager.getBitmapData(resourceName),
          addToWorld: addToWorld,
          isMovable: isMovable);

  /**
   * Create a Sprite object from an image, which is inside a texture atlas(JSON).
   * 
   * * textureAtlasName: name of the texture atlas in the resourceManager
   * * resourceName: name of the resource in the texture atlas(image name without extension) 
   */
  Sprite.textureatlas(State stateContext, String resourceName,
      String textureAtlasName, {bool addToWorld: true, bool isMovable: true})
      : this.bitmapdata(
          stateContext,
          stateContext.game.resourceManager.getTextureAtlas(
              textureAtlasName).getBitmapData(resourceName),
          addToWorld: addToWorld,
          isMovable: isMovable);

  /**
   * Controlls how the object is moving.
   * This implementation is good enough for simple sprites.
   * You can make the sprite move with changing the vx or vy value.
   */
  bool advanceTime(num time) {
    if ((x <= 0 || x >= _context.game.world.width) ||
        (y <= 0 || y >= _context.game.world.height)) {
      removeFromWorld();
    }

    x = x + mainDirection.x * speedX * time;
    y = y + mainDirection.y * speedY * time;

    return true;

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
  addToWorld() {
    _context.game.world.addChild(this);
    if (isMovable) {
      _context.game.world.juggler.add(this);
    }
  }

  /**
   * Removes the sprite from the stage and juggler.
   */
  removeFromWorld() {
    alive = false;
    _context.game.world.removeChild(this);
    if (isMovable) {
      _context.game.world.juggler.remove(this);
    }
  }

  /**
   * Gets the context(State) in which the Sprite was created.
   */
  State get context => _context;

  void rotate(num rads) {
    rotation += rads;
    upDirection = upDirection.rotate(rads);
    downDirection = downDirection.rotate(rads);
    leftDirection = leftDirection.rotate(rads);
    rightDirection = rightDirection.rotate(rads);
  }

  /*void set rotate(num angle) {
    mainDirection.rotate(angle * (math.PI / 180));
  }*/

  move(String direction) {
    switch (direction) {
      case 'forward':
        mainDirection += upDirection;
        break;
      case 'backward':
        mainDirection += downDirection;
        break;
      case 'left':
        mainDirection += leftDirection;
        break;
      case 'right':
        mainDirection += rightDirection;
        break;
    }
  }

  stop() {
    if (!mainDirection.isZero) mainDirection = new StageXL.Vector.zero();
  }

}
