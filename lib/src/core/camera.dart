part of dartrocket;

/**
 * Camera can change the view of the world.
 */
class Camera extends StageXL.DisplayObjectContainer {
  Game _game;
  World _world;
  
  Camera(this._game, this._world){
    _game.stage.addChild(this);
  }
  
  /**
   * Following a sprite object.
   */
  void follow(Sprite sprite){
    if(_world.contains(sprite)){
      _world.removeChild(sprite);
      addChild(sprite);
    }
  }
}