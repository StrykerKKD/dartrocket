part of dartrocket;

/**
 * GameObjectFactory is the supermarket of gameobjects.
 * 
 * The GameObjectFactory is automatically made when you make a game instances.
 * 
 * You can define a defaultResourceMode, which can be image or texture atlas.
 * 
 * You have a defaultTextureAtlas, so you don't have to give the name of the 
 * same texture atlas every time, when you want to make a gameobject.
 * 
 * Usage:
 *     //You can acces it thou the game object and its called 'add'
 *     game.add
 * 
 *     //You can change the default values
 *     game.add.defaultResourceMode = game.add.TEXTUREATLAS;
 *     game.add.defaultTextureAtlasName = "someOtherTextureAtlasName";
 * 
 *     //Making a simple sprite
 *     game.add.sprite('imageName');
 */

class GameObjectFactory {

  static const String IMAGE = 'image';
  static const String TEXTUREATLAS = 'textureatlas';

  /**
   * The current state's context, which the game is in.
   * 
   * **This is automatically updated.**
   */
  State currentContext;

  /**
   * Default resource mode(Image).
   */
  String defaultResourceMode = IMAGE;

  /**
   * Default texture atlas name("").
   */
  String defaultTextureAtlasName = "";

  /**
   * Creates a sprite from image or texture atlas.
   */
  Sprite sprite(String resourceName, {String textureAtlasName: null,
      String resourceMode: null, bool addToWorld: true, bool isMovable: true}) {

    return new Sprite.bitmapdata(
        currentContext,
        _getBitmapData(resourceName, resourceMode, textureAtlasName),
        addToWorld: addToWorld,
        isMovable: isMovable);

  }

  /**
   * Creates multiple sprite from image or texture atlas.
   */
  List<Sprite> multipleSprite(int quantity, String resourceName,
      {String textureAtlasName: null, String resourceMode: null, bool addToWorld:
      true, bool isMovable: true}) {

    List<Sprite> _returnSpriteList = new List<Sprite>();

    for (int i; i < quantity; i++) {
      _returnSpriteList.add(
          sprite(
              resourceName,
              textureAtlasName: textureAtlasName,
              resourceMode: resourceMode,
              addToWorld: addToWorld,
              isMovable: isMovable));
    }

    return _returnSpriteList;

  }

  /**
   * Create a button from image or texture atlas.
   */
  Button button(String resourceName, String text, {String textureAtlasName:
      null, String resourceMode: null, bool addToWorld: true}) {

    return new Button.bitmapdata(
        currentContext,
        _getBitmapData(resourceName, resourceMode, textureAtlasName),
        text,
        addToWorld: addToWorld);

  }

  /**
   * Create a text.
   */
  Text text(String text, {String font: 'Arial', int size: 14, int color:
      StageXL.Color.Black, bool addToWorld: true}) {

    return new Text(
        currentContext,
        text,
        font: font,
        size: size,
        color: color,
        addToWorld: addToWorld);
  }

  /**
   * Create a background from image or texture atlas.
   * 
   * **No color constructor support**
   */
  Background background(String resourceName, {String textureAtlasName: null,
      String resourceMode: null, bool isMovable: false, bool addToWorld: true,
      String repeatMode: null, String scaleMode: null}) {

    return new Background.bitmapdata(
        currentContext,
        _getBitmapData(resourceName, resourceMode, textureAtlasName),
        isMovable: isMovable,
        addToWorld: addToWorld,
        repeatMode: repeatMode,
        scaleMode: scaleMode);

  }

  /**
   * Create a sound.
   */
  Sound sound(String soundName, {num volume: 1, num pan: 0}) {
    return new Sound(currentContext, soundName, volume: volume, pan: pan);
  }

  /**
   * Creates a tween.
   */
  StageXL.Tween tween(Sprite sprite, num time,
      [StageXL.EaseFunction transitionFunction = StageXL.TransitionFunction.linear]) {
    return new StageXL.Tween(sprite, time, transitionFunction);
  }

  StageXL.BitmapData _getBitmapData(String resourceName, [String resourceMode,
      String textureAtlasName]) {

    if (resourceMode == null) {
      resourceMode = defaultResourceMode;
    }

    switch (resourceMode) {

      case IMAGE:

        return currentContext.game.resourceManager.getBitmapData(resourceName);

      case TEXTUREATLAS:

        if (textureAtlasName == null) {
          textureAtlasName = defaultTextureAtlasName;
        }

        return currentContext.game.resourceManager.getTextureAtlas(
            textureAtlasName).getBitmapData(resourceName);

    }

  }

}
