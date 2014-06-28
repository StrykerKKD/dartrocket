part of dartrocket;

class GameObjectFactory {

  State currentContext;
  String defaultResourceMode = ResourceMode.IMAGE;
  String defaultTextureAtlasName;

  Sprite sprite(String resourceName, {String textureAtlasName,String resourceMode, bool addToStage:
      true, bool isMovable: true}) {

    if (resourceMode == null) {
      resourceMode = defaultResourceMode;
    }

    if (resourceMode == ResourceMode.IMAGE) {
      return new Sprite.image(currentContext, resourceName, addToStage:
          addToStage, isMovable: isMovable);
    } else if (resourceMode == ResourceMode.TEXTUREATLAS) {
      
      if(textureAtlasName==null){
        textureAtlasName = defaultTextureAtlasName;
      }
      
      return new Sprite.textureatlas(currentContext, resourceName,
          textureAtlasName, addToStage: addToStage, isMovable: isMovable);
    }

  }

}
