part of dartrocket;

class World extends StageXL.DisplayObjectContainer {
  Game _game;
  
  World(this._game) {
    _game.stage.addChild(this);    
  }
}