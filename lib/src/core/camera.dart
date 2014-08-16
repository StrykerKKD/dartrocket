part of dartrocket;

/**
 * Camera can change the view of the world.
 */
class Camera extends StageXL.DisplayObjectContainer {

  Game _game;

  World _world;

  Camera(this._game, this._world) {
    _game.stage.addChild(this);
  }

  void move(String direction, int distance) {
    switch (direction) {
      case Direction.UP:
        _world.y += distance;
        break;
      case Direction.DOWN:
        _world.y -= distance;
        break;
      case Direction.LEFT:
        _world.x += distance;
        break;
      case Direction.RIGHT:
        _world.x -= distance;
        break;
    }
  }
  
  void follow(Sprite target) {
    
  }
  
}
