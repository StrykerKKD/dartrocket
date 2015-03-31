part of dartrocket.gameobject;

/**
 * This class represents a Text in the game.
 */
class Text extends StageXL.TextField {

  State _context;

//=============================================================================

  static const String DEFAULT_FONT = 'Arial';
  static const int DEFAULT_SIZE = 14;
  static const int DEFAULT_COLOR = StageXL.Color.Black;

//=============================================================================

  /**
   * Makes a new text object.
   */
  Text(State context, String text, {String font: DEFAULT_FONT, int size: DEFAULT_SIZE, int color:DEFAULT_COLOR,
    bool addToWorld:true}) : super() {

    this.text = text;

    this.defaultTextFormat = new StageXL.TextFormat(font, size, color);

    _context = context;
    if(addToWorld){
      this.addToWorld();
    }
  }

//=============================================================================

  /**
   * Add text to the world.
   */
  addToWorld(){
    _context.game.world.addChild(this);
  }
}
