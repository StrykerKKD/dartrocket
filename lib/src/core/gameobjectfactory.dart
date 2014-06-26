part of dartrocket;

class GameObjectFactory {

  State currentContext;
  String resourceMode = 'image';

  Sprite sprite(String resourceName, [String textureAtlasName]) {

    if (resourceMode == 'image') {
      return new Sprite.image(currentContext, resourceName);
    } else if (resourceMode == 'textureatlas') {
      return new Sprite.textureatlas(currentContext, textureAtlasName,
          resourceName);
    }

  }

}
