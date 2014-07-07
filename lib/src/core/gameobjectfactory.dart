part of dartrocket;

class GameObjectFactory {

  static const String IMAGE = 'image';
  static const String TEXTUREATLAS = 'textureatlas';

  State currentContext;
  String defaultResourceMode = IMAGE;
  String defaultTextureAtlasName = "";
  
  /**
   * Creates a sprite from image or texture atlas.
   */
  Sprite sprite(String resourceName, {String textureAtlasName, 
    String resourceMode, bool addToStage: true, bool isMovable: true}) {

    if (resourceMode == null) {
      resourceMode = defaultResourceMode;
    }

    switch (resourceMode) {
      
      case IMAGE:
        
        return new Sprite.image(currentContext, resourceName, addToStage:
            addToStage, isMovable: isMovable);        
      
      case TEXTUREATLAS:
        
        if (textureAtlasName == null) {
          textureAtlasName = defaultTextureAtlasName;
        }

        return new Sprite.textureatlas(currentContext, resourceName,
            textureAtlasName, addToStage: addToStage, isMovable: isMovable);
        
    }

  }
  
  /**
   * Create a button from image or texture atlas.
   */
  Button button(String resourceName, String text, 
                {String textureAtlasName, String resourceMode,
                 bool addToStage: true}) {
    
    if (resourceMode == null) {
      resourceMode = defaultResourceMode;
    }
    
    switch (resourceMode) {
      
      case IMAGE:
        
        return new Button.image(currentContext, resourceName, text,
            addToStage: addToStage);
      
      case TEXTUREATLAS:
        
        if (textureAtlasName == null) {
          textureAtlasName = defaultTextureAtlasName;
        }
        
        return new Button.textureatlas(currentContext, resourceName, 
            textureAtlasName, text,addToStage: addToStage);
    }
    
    
  }
  
  
  /**
   * Creates multiple sprite from image or texture atlas.
   */
  List<Sprite> multipleSprite(int quantity, String resourceName, 
      {String textureAtlasName, String resourceMode, 
       bool addToStage: true, bool isMovable: true}){
    
    List<Sprite> _returnSpriteList = new List<Sprite>();
    
    if (resourceMode == null) {
      resourceMode = defaultResourceMode;
    }
    
    if (textureAtlasName == null) {
      textureAtlasName = defaultTextureAtlasName;
    }
    
    for (int i;i < quantity;i++) {
      _returnSpriteList.add(sprite(resourceName, textureAtlasName: textureAtlasName, 
                             resourceMode: resourceMode, addToStage: addToStage,
                             isMovable: isMovable));
    }
    
    return _returnSpriteList;
  }
  
}
