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
   * Create a Button from [StageXL.BitmapData ].
   * 
   * * stateContext: current state you are in
   * * text: label of the button
   * * addToStage: add the button to the stage?
   */
  Button.bitmapdata(State stateContext, StageXL.BitmapData bitmapData, String
      text, {bool addToStage: true}) : super(bitmapData) {
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
  
  /**
   * Create a Button object from an image.
   * 
   * * resourceName: name of the image in the resourcesManager
   */
  Button.image(State stateContext, String resourceName, String text, {bool
      addToStage: true}) 
    : this.bitmapdata(stateContext, 
        stateContext.game.resourceManager.getBitmapData(resourceName), 
        text, addToStage: addToStage);
  
  /**
   * Create Button from an image inside a texture atlas.
   * 
   * * textureAtlasName: name of the texture atlas in the resourceManager
   * * resourceName: name of the resource in the texture atlas(image name without extension)
   */
  Button.textureatlas(State stateContext, String textureAtlasName, 
      String resourceName, String text, {bool addToStage: true}) 
    : this.bitmapdata(stateContext, 
        stateContext.game.resourceManager.getTextureAtlas(textureAtlasName)
          .getBitmapData(resourceName), 
        text, addToStage: addToStage);

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
