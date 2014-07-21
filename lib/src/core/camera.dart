part of dartrocket;

class Camera extends StageXL.Sprite {
  Game _game;
  World _world;
  
  Camera(this._game, this._world){
    _game.stage.addChild(this);
  }
}