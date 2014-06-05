part of dartrocket;

class Button extends Sprite {

  Text buttonText;

  Button(State context, String resourceName,String text) : super(context, resourceName,
      isMoveAble: false) {
    buttonText = new Text(context, text)
    ..width = width
    ..height = height
    ..defaultTextFormat.align = StageXL.TextFormatAlign.CENTER;       
  }

  void setCoordinates(int x, int y) {
    this.x = x;
    this.y = y;
    buttonText.x = x;
    buttonText.y = y;    
  }
  
  StageXL.EventStream<StageXL.MouseEvent> get onMouseClick => StageXL.InteractiveObject.mouseClickEvent.forTarget(buttonText);

}
