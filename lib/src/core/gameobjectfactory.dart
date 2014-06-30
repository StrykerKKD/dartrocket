part of dartrocket;

class GameObjectFactory {

  static const String IMAGE = 'image';
  static const String TEXTUREATLAS = 'textureatlas';

  State currentContext;
  String defaultResourceMode = IMAGE;
  String defaultTextureAtlasName;

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

}
