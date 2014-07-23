part of dartrocket;

class World extends StageXL.DisplayObjectContainer {
  Game _game;
  
  num width, height;
  StageXL.Juggler juggler;
  
  World(this._game, width, height) {
    juggler = _game.stage.juggler;
    this.width = width;
    this.height = height;
    
    _game.stage.addChild(this);    
  }
}