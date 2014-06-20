part of dartrocket;

/**
 * Represents a simple Button.
 * 
 * Example:
 *      Button button = new Button(this, "resourceName", "buttonText")
 *        ..setCoordinates(300, 400)
 *        ..onMouseClick() //mouse click eventlistener
 *        ..onTouchEnd(); //touch eventlistener
 */
class Button extends InteractiveBitmap {

  State _context;
  /**
   * Text on the button.
   */
  Text buttonText;

  /**
   * Makes a Button object.
   */
  Button(State stateContext, String resourceName, String text, {bool addToStage:
      true}) : super(stateContext.game.resourceManager.getBitmapData(resourceName)) {
    _context = stateContext;

    buttonText = new Text(stateContext, text, addToStage: false)
        ..width = width
        ..height = height
        ..defaultTextFormat.align = StageXL.TextFormatAlign.CENTER
        ..mouseEnabled = false;
    buttonText
        ..defaultTextFormat.topMargin = (buttonText.height -
            buttonText.textHeight) ~/ 2
        ..text = text;

    if (addToStage) {
      this.addToStage();
    }
  }

  Button.textureatlas(State stateContext,String textureAtlasName ,String resourceName, String
      text, {bool addToStage: true}) : super(stateContext.game.resourceManager.getTextureAtlas(textureAtlasName).getBitmapData(resourceName)) {
    _context = stateContext;

    buttonText = new Text(stateContext, text, addToStage: false)
        ..width = width
        ..height = height
        ..defaultTextFormat.align = StageXL.TextFormatAlign.CENTER
        ..mouseEnabled = false;
    buttonText
        ..defaultTextFormat.topMargin = (buttonText.height -
            buttonText.textHeight) ~/ 2
        ..text = text;

    if (addToStage) {
      this.addToStage();
    }
  }

  set x(int x) {
    super.x = x;
    buttonText.x = x;
  }
  set y(int y) {
    super.y = y;
    buttonText.y = y;
  }

  addToStage() {
    _context.game.stage.addChild(this);
    _context.game.stage.addChild(buttonText);
  }

  State get context => _context;

}
