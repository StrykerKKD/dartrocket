part of dartrocket;

class Button extends Sprite {

  Text buttonText;

  Button(State context, String resourceName,String buttonText) : super(context, resourceName,
      isMoveAble: false) {
    this.buttonText = new Text(context, buttonText)
    ..width = width
    ..height = height
    ..defaultTextFormat.align="center";    
  }

  void setCoordinates(int x, int y) {
    this.x = x;
    this.y = y;
    buttonText.x = x;
    buttonText.y = y;
  }
  
  StageXL.EventStream<StageXL.MouseEvent> get onMouseClick => StageXL.InteractiveObject.mouseClickEvent.forTarget(buttonText);


}
