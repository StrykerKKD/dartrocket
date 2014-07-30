part of dartrocket;

class World extends StageXL.DisplayObjectContainer {
  Game _game;
  
  /**
   * Widht of the world.
   */
  num width;
  
  /**
   * Height of the world.
   */
  num height;
  
  /**
   * [StageXL.Juggler] object of the world.
   * 
   * Uses the stage's juggler object.
   */
  StageXL.Juggler juggler;
  
  World(this._game, width, height) {
    juggler = _game.stage.juggler;
    this.width = width;
    this.height = height;
    
    _game.stage.addChild(this);    
  }
}