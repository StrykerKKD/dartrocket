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

  Map<String, bool> _isDownBy = new Map<String, bool>();

  static const String TOUCH_INPUT = 'touch';
  static const String MOUSE_INPUT = 'mouse';

  /**
   * Text on the button.
   */
  Text buttonText;

  /**
   * Create a Button from [StageXL.BitmapData ].
   * 
   * * stateContext: current state you are in
   * * text: label of the button
   * * addToWorld: add the button to the world?
   */
  Button.bitmapdata(State stateContext, StageXL.BitmapData bitmapData,
      String text, {bool addToWorld: true}) : super(
      bitmapData) {
    _context = stateContext;

    buttonText = new Text(stateContext, text, addToWorld: false)
        ..width = width
        ..height = height
        ..defaultTextFormat.align = StageXL.TextFormatAlign.CENTER
        ..mouseEnabled = false;
    buttonText
        ..defaultTextFormat.topMargin = (buttonText.height -
            buttonText.textHeight) ~/
            2
        ..text = text;

    if (addToWorld) {
      this.addToWorld();
    }
  }

  /**
   * Create a Button object from an image.
   * 
   * * resourceName: name of the image in the resourcesManager
   */
  Button.image(State stateContext, String resourceName, String text,
      {bool addToWorld: true})
      : this.bitmapdata(
          stateContext,
          stateContext.game.resourceManager.getBitmapData(resourceName),
          text,
          addToWorld: addToWorld);

  /**
   * Create Button from an image inside a texture atlas.
   * 
   * * textureAtlasName: name of the texture atlas in the resourceManager
   * * resourceName: name of the resource in the texture atlas(image name without extension)
   */
  Button.textureatlas(State stateContext, String resourceName,
      String textureAtlasName, String text, {bool addToWorld: true})
      : this.bitmapdata(
          stateContext,
          stateContext.game.resourceManager.getTextureAtlas(
              textureAtlasName).getBitmapData(resourceName),
          text,
          addToWorld: addToWorld);

  set x(int x) {
    super.x = x;
    buttonText.x = x;
  }

  set y(int y) {
    super.y = y;
    buttonText.y = y;
  }

  /**
   * Add button to the world.
   */
  addToWorld() {
    _context.game.world.addChild(this);
    _context.game.world.addChild(buttonText);
  }

  /**
   * Get state which the button was made.
   */
  State get context => _context;

  /**
   * Checks if the button is held down by touch.
   */
  bool isDownByTouch() {
    if (!_isDownBy.containsKey(TOUCH_INPUT)) {
      _isDownBy[TOUCH_INPUT] = false;

      onTouchBegin.listen((_) {
        _isDownBy[TOUCH_INPUT] = true;
      });

      onTouchEnd.listen((_) {
        _isDownBy[TOUCH_INPUT] = false;
      });

    }
    return _isDownBy[TOUCH_INPUT];

  }

  /**
   * Checks if the button is held down by mouse.
   */
  bool isDownByMouse() {
    if (!_isDownBy.containsKey(MOUSE_INPUT)) {
      _isDownBy[MOUSE_INPUT] = false;

      onMouseDown.listen((_) {
        _isDownBy[MOUSE_INPUT] = true;
      });

      onMouseUp.listen((_) {
        _isDownBy[MOUSE_INPUT] = false;
      });
    }
    return _isDownBy[MOUSE_INPUT];
  }

  /**
   * Checks if the button is held down by an input(touch or mouse).
   */
  bool isDownBy(String input) {
    if (!_isDownBy.containsKey(input)) {
      switch (input) {
        case TOUCH_INPUT:
          return isDownByTouch();
        case MOUSE_INPUT:
          return isDownByMouse();
      }
    }
    return _isDownBy[input];
  }

}
