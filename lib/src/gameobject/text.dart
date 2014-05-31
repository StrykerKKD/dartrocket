part of dartrocket;

class Text extends StageXL.TextField {
  State _context;
  
  Text(State context, String text, {String font: 'Arial', int size: 14, int color:
      StageXL.Color.Black,bool addToStage:true}) : super() {
    
    this.text = text;
    
    this.defaultTextFormat = new StageXL.TextFormat(font, size, color);
    
    _context = context;
    if(addToStage){
      _context.game.stage.addChild(this);
    }
  }
  
  addToStage(){
    _context.game.stage.addChild(this);
  }
}
