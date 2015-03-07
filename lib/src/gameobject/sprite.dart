part of dartrocket.gameobject;

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
 * good for making more complex Sprite objects. For example: ufo
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
 * You can find more examples about Sprite class in the spaceinvader example.
 *
 * Check out the movementsystem example to see how the sprites can move.
 * */

class Sprite extends InteractiveBitmap with MovementControl implements
    StageXL.Animatable {

  State _context;

//=============================================================================

  /**
   * Does the sprite move?
   */
  bool isMovable;

  /**
   * Is the sprite alive?
   * */
  bool alive = false;

  /**
   * Sprite can't go outside of the bounds of the world.
   */
  bool collideWorldBounds = false;

  /**
   * Kill Sprite if it's out of the world's bounds.
   */
  bool killOutOfBounds = false;

  /**
   * Enable gravity for this Sprite.
   */
  bool enableGravity = false;

//=============================================================================

  /**
   * Gets the context(State) in which the Sprite was created.
   */
  State get context => _context;

//=============================================================================

  /**
   * Create a Sprite object from [StageXL.BitmapData].
   *
   * * stateContext: context of the State, which this object is in
   * * bitmapData: bitmapdata for the sprite
   * * addToWorld: automatically add the sprite to the world?
   * * isMoveAble: will the sprite move?
   *
   * */
  Sprite.bitmapdata(State stateContext, StageXL.BitmapData bitmapData,
      {bool addToWorld: true, bool isMovable: true})
      : super(bitmapData) {
    this.isMovable = isMovable;
    _context = stateContext;
    movementSystem = new MovementSystem(this);
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

//=============================================================================

  /**
   * Defines where the sprite will move next.
   */
  bool advanceTime(num time) {

    _checkKillOutOfBounds();

    _checkCollideWorldBounds();

    _checkEnableGravity();

    movementSystem.addVelocity(_context.game.physics.gravity.getVelocity());

    movementSystem.update(time);

    return true;

  }

//=============================================================================

  /**
   * Sprite will be added to the world and to the juggler if the sprite is moveable.
   */
  void addToWorld() {
    alive = true;
    _context.game.world.addChild(this);
    if (isMovable) {
      _context.game.world.juggler.add(this);
    }
  }

  /**
   * Removes the sprite from the world and juggler.
   */
  void removeFromWorld() {
    alive = false;
    _context.game.world.removeChild(this);
    if (isMovable) {
      _context.game.world.juggler.remove(this);
    }
  }

//=============================================================================

  void _checkKillOutOfBounds() {
    if (killOutOfBounds &&
        ((x + width <= 0 || x - width >= _context.game.world.width) ||
            (y + height <= 0 || y - height >= _context.game.world.height))) {
      alive = false;
      removeFromWorld();
    }
  }

  void _checkCollideWorldBounds() {
    if (collideWorldBounds) {
      if ((y - pivotY <= 0 &&
          movementSystem.directionSystem.mainDirection.y < 0) ||
          (y + height - pivotY >= _context.game.world.height &&
              movementSystem.directionSystem.mainDirection.y > 0)) {
        movementSystem.directionSystem.nullMainDirectionY();
      }

      if ((x - pivotX <= 0 &&
          movementSystem.directionSystem.mainDirection.x < 0) ||
          (x + width - pivotX >= _context.game.world.width &&
              movementSystem.directionSystem.mainDirection.x > 0)) {
        movementSystem.directionSystem.nullMainDirectionX();
      }
    }
  }

  void _checkEnableGravity() {
    if (!enableGravity &&
        !_context.game.physics.gravity.directionSystem.mainDirection.isZero) {
      _context.game.physics.gravity.directionSystem.nullMainDirection();
    }
  }

}
