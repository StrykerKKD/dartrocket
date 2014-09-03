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

class Sprite extends InteractiveBitmap implements StageXL.Animatable {

  State _context;

  num _accelerationDirection = 0;

  static const int _NO_ACCELERATION_DIRECTION = 0;

  static const int _SPEED_UP_DIRECTION = 1;

  static const int _SLOW_DOWN_DIRECTION = -1;


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

  /**
   * Horizontal speed of the sprite.
   * */
  num speedX = 0;

  /**
   * Vertical speed of the sprite
   * */
  num speedY = 0;

  /**
   * Horizontal acceleration of the sprite.
   */
  num accelerationX = 0;

  /**
   * Vertical acceleration of the sprite.
   */
  num accelerationY = 0;

  /**
   * The maximum speed limit for the Sprite.
   */
  num maxSpeed = 0;

  /**
   * The minimum speed limit for the Sprite.
   */
  num minSpeed = 0;

  /**
   * Sprite's vector based [DirectionSystem].
   */
  DirectionSystem directionSystem = new DirectionSystem();

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
   * Defines where the sprite will move next.
   */
  bool advanceTime(num time) {

    _checkKillOutOfBounds();

    _checkCollideWorldBounds();

    _checkEnableGravity();

    _checkSpeedLimits();

    speedX += _accelerationDirection * accelerationX * time;
    speedY += _accelerationDirection * accelerationY * time;

    x = x +
        (directionSystem.mainDirection.x * speedX +
            _context.game.physics.gravityDirectionSystem.mainDirection.x *
                _context.game.physics.garvitySpeed) *
            time;
    y = y +
        (directionSystem.mainDirection.y * speedY +
            _context.game.physics.gravityDirectionSystem.mainDirection.y *
                _context.game.physics.garvitySpeed) *
            time;

    return true;

  }

  /**
   * Put the pivot point into the center of the sprite.
   */
  void centerPivot() {
    pivotX = bitmapData.width / 2;
    pivotY = bitmapData.height / 2;
  }

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

  /**
   * Gets the context(State) in which the Sprite was created.
   */
  State get context => _context;

  /**
   * Set the horizontal and vertical speed with the same value.
   */
  void set speed(num speed) {
    speedX = speed;
    speedY = speed;
  }

  /**
   * Set the horizontal and vertical acceleration with the same value.
   */
  void set acceleration(num acceleration) {
    accelerationX = acceleration;
    accelerationY = acceleration;
  }

  /**
   * Rotate the sprite and it's direction system in radians.
   */
  void rotateRadians(num radians) {
    rotation += radians;
    directionSystem.rotateDirectionsRadians(radians);
  }

  /**
   * Rotate the sprite and it's direction system in angles.
   */
  void rotateAngles(num angles) {
    rotateRadians(angles * (math.PI / 180));
  }

  /**
   * Moving the sprite in a direction.
   * 
   * This method uses the [DirectionSystem]'s addToMainDirection method, which means
   * that the input direction will be added to the main direction.
   * 
   * This means that opposite directions will to stop the sprite movements.
   * It also means that it's easy to make the sprite move diagonally and
   * it also make transition between directions better.
   * 
   * Diagonal moving: adding together two non-oposite directions make the sprite move diagonally.
   * For example: up + left will make the sprite move up-left direction.
   *
   * Please use [Direction]'s static members for the input.
   */
  void move(String direction) {
    directionSystem.addToMainDirection(direction);
  }
  
  /**
   * Moving the sprite in only one direction.
   * 
   * This method uses [DirectionSystem]'s setMainDirection method, which means
   * that the main direction will be the input direction.
   * 
   * This means instant direction change and opposite directions wont stop the sprite.
   * 
   * Please use [Direction]'s static members for the input.
   */
  void moveSetDirection(String direction) {
    directionSystem.setMainDirection(direction);
  }

  //TODO: make it work
  void moveBy(String direction, {int distance: 0}) {

  }

  //TODO: make it work
  void moveTo(int x, int y) {

  }

  /**
   * Stops the movement of the sprite.
   */
  void stop() {
    directionSystem.nullMainDirection();
  }

  /**
   * Speed up the sprite's movement.
   */
  void speedUP() {
    if (_speedOverEqualMaxSpeed() && _accelerationDirection == 1) {
      _accelerationDirection = _NO_ACCELERATION_DIRECTION;
    } else {
      _accelerationDirection = _SPEED_UP_DIRECTION;
    }
  }

  /**
   * Slows down the sprite's movement.
   */
  void slowDown() {
    if (_speedUnderEqualMinSpeed() && _accelerationDirection == -1) {
      _accelerationDirection = _NO_ACCELERATION_DIRECTION;
    } else {
      _accelerationDirection = _SLOW_DOWN_DIRECTION;
    }
  }

  /**
   * Stop the acceleration, both speed up and slow down.
   */
  void stopSpeedChange() {
    _accelerationDirection = _NO_ACCELERATION_DIRECTION;
  }


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
      if ((y - pivotY <= 0 && directionSystem.mainDirection.y < 0) ||
          (y + height - pivotY >= _context.game.world.height &&
              directionSystem.mainDirection.y > 0)) {
        directionSystem.nullMainDirectionY();
      }

      if ((x - pivotX <= 0 && directionSystem.mainDirection.x < 0) ||
          (x + width - pivotX >= _context.game.world.width &&
              directionSystem.mainDirection.x > 0)) {
        directionSystem.nullMainDirectionX();
      }
    }
  }

  void _checkEnableGravity() {
    if (!enableGravity &&
        !_context.game.physics.gravityDirectionSystem.mainDirection.isZero) {
      _context.game.physics.gravityDirectionSystem.nullMainDirection();
    }
  }

  void _checkSpeedLimits() {
    if (_speedOverEqualMaxSpeed() && _accelerationDirection == 1) {
      _accelerationDirection = 0;
    }

    if (_speedUnderEqualMinSpeed() && _accelerationDirection == -1) {
      _accelerationDirection = 0;
    }
  }

  bool _speedOverEqualMaxSpeed() {
    return (speedX >= maxSpeed || speedY >= maxSpeed);
  }

  bool _speedUnderEqualMinSpeed() {
    return (speedX <= minSpeed || speedY <= minSpeed);
  }

}
