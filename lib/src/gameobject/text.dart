part of dartrocket;

class Text extends StageXL.TextField {

  Text(text, {String font: 'Arial', int size: 14, int color:
      StageXL.Color.Black}) : super() {
    
    this.text = text;
    
    this.defaultTextFormat = new StageXL.TextFormat(font, size, color);
  }
}
