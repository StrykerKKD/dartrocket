part of dartrocket.core;

/**
 * You view the world thru the camera.
 *
 * Example:
 *      //This will move the camera upwards by 10 pixel
 *      game.camera.moveDistance(Direction.UP,distance:10);
 *
 *      //follows the player, which must be a Sprite
 *      game.camera.follow(player);
 *
 *      //unfollow the followed Sprite
 *      game.camera.unfollow();
 */
class Camera extends StageXL.DisplayObjectContainer with MovementControl {

  Game _game;

  World _world;

  bool _following = false;

  Sprite _targetSprite;

  StageXL.Point _targetPoint;

  num _targetWorldX;

  num _targetWorldY;

//=============================================================================

  /**
   * Widht of the camera.
   */
  num width;

  /**
   * Height of the camera.
   */
  num height;

//=============================================================================

  Camera(this._game, this._world) {
    _game.stage.addChild(this);

    movementSystem = new MovementSystem(_world);
    movementSystem.directionSystem.rotateDirectionsAngles(180);

    width = _game.stage.sourceWidth;
    height = _game.stage.sourceHeight;

    pivotX = width ~/ 2;
    pivotY = height ~/ 2;
  }

//=============================================================================

  /**
   * Camera will follow the target.
   */
  void follow(Sprite target) {
    _targetSprite = target;
    _following = true;
  }

  /**
   * Camera will not follow the target.
   */
  void unfollow() {
    _following = false;
    _targetSprite = null;
  }

//=============================================================================

  void _update(num time) {
    if (_following) {

      _targetWorldX = _world.x + _targetSprite.x;
      _targetWorldY = _world.y + _targetSprite.y;
      //print("$_targetWorldX, $_targetWorldY");

      //_targetPoint = _targetSprite.localToGlobal(new StageXL.Point(_world.x,_world.y));
      //print(_targetPoint);

      if (_targetWorldX != pivotX || _targetWorldY != pivotY) {

        num diffX = pivotX - _targetWorldX;
        num diffY = pivotY - _targetWorldY;

        _world.x += diffX;
        _world.y += diffY;

      }

    } else {
      movementSystem.update(time);
    }
  }

}
