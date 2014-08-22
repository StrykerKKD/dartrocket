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

  StageXL.Vector _newDirection;

  final StageXL.Vector _zeroOneVector = new StageXL.Vector(0, 1);

  final StageXL.Vector _oneZeroVector = new StageXL.Vector(1, 0);

  static const int _NO_ACCELERATION_DIRECTION = 0;

  static const int _SPEED_UP_DIRECTION = 1;

  static const int _SLOW_DOWN_DIRECTION = -1;

  static const int _MAX_LENGTH_FOR_MAIN_DIRECTION = 1;

  static const double _MAX_LENGTH_WITH_PRECISION = 1.001;

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
   * The direction where the sprite is heading.
   * */
  StageXL.Vector mainDirection = new StageXL.Vector.zero();

  StageXL.Vector upDirection = new StageXL.Vector(0, -1);
  StageXL.Vector downDirection = new StageXL.Vector(0, 1);
  StageXL.Vector leftDirection = new StageXL.Vector(-1, 0);
  StageXL.Vector rightDirection = new StageXL.Vector(1, 0);

  final StageXL.Vector zeroVector = new StageXL.Vector.zero();


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
   * Defines where the sprite will move next.
   */
  bool advanceTime(num time) {
    if (killOutOfBounds &&
        ((x + width <= 0 || x - width >= _context.game.world.width) ||
            (y + height <= 0 || y - height >= _context.game.world.height))) {
      removeFromWorld();
    }

    if (collideWorldBounds) {
      if ((y - pivotY <= 0 && mainDirection.y < 0) ||
          (y + height - pivotY >= _context.game.world.height && mainDirection.y > 0)) {
        mainDirection *= _oneZeroVector;
      }

      if ((x - pivotX <= 0 && mainDirection.x < 0) ||
          (x + width - pivotX >= _context.game.world.width && mainDirection.x > 0)) {
        mainDirection *= _zeroOneVector;
      }
    }

    if (_speedOverEqualMaxSpeed() && _accelerationDirection == 1) {
      _accelerationDirection = 0;
    }

    if (_speedUnderEqualMinSpeed() && _accelerationDirection == -1) {
      _accelerationDirection = 0;
    }

    speedX += _accelerationDirection * accelerationX * time;
    speedY += _accelerationDirection * accelerationY * time;

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
   * Sprite will be added to the world and to the juggler if the sprite is moveable.
   */
  addToWorld() {
    _context.game.world.addChild(this);
    if (isMovable) {
      _context.game.world.juggler.add(this);
    }
  }

  /**
   * Removes the sprite from the world and juggler.
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
   * Rotate the sprite and it's direction vectors in radians.
   */
  void rotateRadians(num radians) {
    rotation += radians;
    mainDirection = mainDirection.rotate(radians);
    upDirection = upDirection.rotate(radians);
    downDirection = downDirection.rotate(radians);
    leftDirection = leftDirection.rotate(radians);
    rightDirection = rightDirection.rotate(radians);
  }

  /**
   * Rotate the sprite and it's direction vectors in angles.
   */
  void rotateAngles(num angles) {
    rotateRadians(angles * (math.PI / 180));
  }

  /**
   * Moving the sprite in a direction.
   *
   * Direction can be: up/forward, down/backward, left, right
   */
  move(String direction) {

    _newDirection = mainDirection;

    switch (direction) {
      case Direction.UP:
      case Direction.FORWARD:
        _newDirection += upDirection;
        break;
      case Direction.DOWN:
      case Direction.BACKWARD:
        _newDirection += downDirection;
        break;
      case Direction.LEFT:
        _newDirection += leftDirection;
        break;
      case Direction.RIGHT:
        _newDirection += rightDirection;
        break;
    }

    if (_newDirection.length > _MAX_LENGTH_WITH_PRECISION) {
      mainDirection = _newDirection.scaleLength(_MAX_LENGTH_FOR_MAIN_DIRECTION);
    } else {
      mainDirection = _newDirection;
    }
  }

  /**
   * Stops the movement of the sprite.
   */
  stop() {
    if (!mainDirection.isZero) mainDirection = zeroVector;
  }

  /**
   * Speed up the sprite's movement.
   */
  speedUP() {
    if (_speedOverEqualMaxSpeed() && _accelerationDirection == 1) {
      _accelerationDirection = _NO_ACCELERATION_DIRECTION;
    } else {
      _accelerationDirection = _SPEED_UP_DIRECTION;
    }
  }

  /**
   * Slows down the sprite's movement.
   */
  slowDown() {
    if (_speedUnderEqualMinSpeed() && _accelerationDirection == -1) {
      _accelerationDirection = _NO_ACCELERATION_DIRECTION;
    } else {
      _accelerationDirection = _SLOW_DOWN_DIRECTION;
    }
  }

  /**
   * Stop the acceleration, both speed up and slow down.
   */
  stopSpeedChange() {
    _accelerationDirection = _NO_ACCELERATION_DIRECTION;
  }


  bool _speedOverEqualMaxSpeed() {
    return (speedX >= maxSpeed || speedY >= maxSpeed);
  }

  bool _speedUnderEqualMinSpeed() {
    return (speedX <= minSpeed || speedY <= minSpeed);
  }

}
