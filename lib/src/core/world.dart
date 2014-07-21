part of dartrocket;

class World extends StageXL.Sprite {
  Game _game;
  
  World(this._game) {
    _game.stage.addChild(this);
  }
}