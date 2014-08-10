part of dartrocket;

/**
 * This class represents a Text in the game.
 */
class Text extends StageXL.TextField {
  
  State _context;
  
  /**
   * Makes a new text object.
   */
  Text(State context, String text, {String font: 'Arial', int size: 14, int color:
      StageXL.Color.Black,bool addToWorld:true}) : super() {
    
    this.text = text;
    
    this.defaultTextFormat = new StageXL.TextFormat(font, size, color);
    
    _context = context;
    if(addToWorld){
      this.addToWorld();
    }
  }
  
  /**
   * Add text to the world.
   */
  addToWorld(){
    _context.game.world.addChild(this);
  }
}
