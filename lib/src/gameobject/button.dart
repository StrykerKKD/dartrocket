part of dartrocket;

class Button extends InteractiveBitmap {

  State _context;
  Text buttonText;

  Button(State context, String resourceName, String text, {bool addToStage:
      true}) : super(context.game.resourceManager.getBitmapData(resourceName)) {
    _context = context;

    buttonText = new Text(context, text, addToStage: false)
        ..width = width
        ..height = height
        ..defaultTextFormat.align = StageXL.TextFormatAlign.CENTER;
    buttonText
        ..defaultTextFormat.topMargin = (buttonText.height -
            buttonText.textHeight) ~/ 2
        ..text = text;

    if (addToStage) {
      this.addToStage();
    }
  }

  addToStage() {
    _context.game.stage.addChild(this);
    _context.game.stage.addChild(buttonText);

  }

  void setCoordinates(int x, int y) {
    this.x = x;
    this.y = y;
    buttonText.x = x;
    buttonText.y = y;
  }

  StageXL.EventStream<StageXL.MouseEvent> get onMouseOver =>
      StageXL.InteractiveObject.mouseOverEvent.forTarget(buttonText);
  StageXL.EventStream<StageXL.MouseEvent> get onMouseDown =>
      StageXL.InteractiveObject.mouseDownEvent.forTarget(buttonText);
  StageXL.EventStream<StageXL.MouseEvent> get onMouseUp =>
      StageXL.InteractiveObject.mouseUpEvent.forTarget(buttonText);
  StageXL.EventStream<StageXL.MouseEvent> get onMouseClick =>
      StageXL.InteractiveObject.mouseClickEvent.forTarget(buttonText);

  StageXL.EventStream<StageXL.TouchEvent> get onTouchOver =>
      StageXL.InteractiveObject.touchOverEvent.forTarget(buttonText);
  StageXL.EventStream<StageXL.TouchEvent> get onTouchBegin =>
      StageXL.InteractiveObject.touchBeginEvent.forTarget(buttonText);
  StageXL.EventStream<StageXL.TouchEvent> get onTouchEnd =>
      StageXL.InteractiveObject.touchEndEvent.forTarget(buttonText);

  State get context => _context;

}
