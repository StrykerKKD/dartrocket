part of dartrocket;

/**
 * You can make (moving)background with this class.
 * 
 * Background is made of an image, which in this case I use it as a tile.
 * Basically the background is just a bunch of tiles.
 */
class Background implements StageXL.Animatable {
  List<StageXL.Bitmap> _backgroundTileList = new List<StageXL.Bitmap>();
  State _context;


  static const String REPEAT_NONE = "repeatNone";
  static const String REPEAT_X = "repeatX";
  static const String REPEAT_Y = "repeatY";
  static const String REPEAT_XY = "repeatYX";

  static const String SCALE_NONE = "scaleNone";
  static const String SCALE_FULL_X = "scaleFullX";
  static const String SCALE_FULL_Y = "scaleFullY";
  static const String SCALE_FULL_XY = "scaleFullXY";

  static const String DEFAULT_REPEAT_MODE = REPEAT_NONE;
  static const String DEFAULT_SCALE_MODE = SCALE_NONE;

  /**
   * Horizontal speed of the tiles
   */
  int vx = 0;
  /**
   * Vertical speed of the tiles.
   */
  int vy = 0;

  /**
   * Is the background movable.
   */
  bool isMovable;

  /**
   * Create tile based background from [StageXL.BitmapData].
   */
  Background.bitmapdata(State stateContext, StageXL.BitmapData bitmapData, 
      {bool isMovable: false, bool addToStage: true, 
        String repeatMode: DEFAULT_REPEAT_MODE, 
        String scaleMode: DEFAULT_SCALE_MODE}) {
    
    _context = stateContext;

    StageXL.BitmapData backgroundTileBitmapdata = bitmapData;
    StageXL.Bitmap backgroundTileBitmap;


    int yTimes = 1;
    int xTimes = 1;

    switch (repeatMode) {
      case REPEAT_NONE:
        break;
      case REPEAT_X:
        xTimes = (_context.game.stage.sourceWidth /
            backgroundTileBitmapdata.width).ceil();
        break;
      case REPEAT_Y:
        yTimes = (_context.game.stage.sourceHeight /
            backgroundTileBitmapdata.height).ceil();
        break;
      case REPEAT_XY:
        yTimes = (_context.game.stage.sourceHeight /
            backgroundTileBitmapdata.height).ceil();
        xTimes = (_context.game.stage.sourceWidth /
            backgroundTileBitmapdata.width).ceil();
        break;
    }
    
    
    double xScale = 1.0;
    double yScale = 1.0;
    
    switch (scaleMode) {
      case SCALE_NONE:
        break;
      case SCALE_FULL_X:
        xTimes = 1;
        xScale = (_context.game.stage.sourceWidth / 
            backgroundTileBitmapdata.width);
        break;
      case SCALE_FULL_Y:
        yTimes = 1;
        yScale = (_context.game.stage.sourceHeight /
            backgroundTileBitmapdata.height);
        break;
      case SCALE_FULL_XY:
        xScale = (_context.game.stage.sourceWidth / 
                    backgroundTileBitmapdata.width);
        yScale = (_context.game.stage.sourceHeight /
                    backgroundTileBitmapdata.height);
        break;
    }

    for (int i = 0; i < yTimes+1; i++) {
      for (int j = 0; j < xTimes+1; j++) {
        backgroundTileBitmap = new StageXL.Bitmap(backgroundTileBitmapdata);
        backgroundTileBitmap
            ..x = backgroundTileBitmap.width * j
            ..y = backgroundTileBitmap.height * i
            ..scaleX = xScale
            ..scaleY = yScale;
        _backgroundTileList.add(backgroundTileBitmap);
      }
    }

    this.isMovable = isMovable;
    if (addToStage) {
      this.addToStage();
    }
  }
  
  /**
   * Create static colored background. 
   */
  Background.color(State stateContext, 
       {bool isMovable: false, bool addToStage: true, 
        int width: 1, int height: 1, bool transparent: false, 
        int color: 4294967295, num pixelRatio: 1.0,
        String repeatMode: DEFAULT_REPEAT_MODE, 
        String scaleMode: DEFAULT_SCALE_MODE})
      : this.bitmapdata(stateContext, 
          new StageXL.BitmapData(width,height,transparent,color,pixelRatio),
          isMovable: isMovable, addToStage: addToStage,
          repeatMode: repeatMode, scaleMode: scaleMode
      );

  /**
   * Create a Background object from an image.
   * 
   * * resourceName: name of the image in the resourcesManager
   */
  Background.image(State stateContext, String resourceName, 
      {bool isMovable: false, bool addToStage: true, 
       String repeatMode: DEFAULT_REPEAT_MODE, 
       String scaleMode: DEFAULT_SCALE_MODE}) 
    : this.bitmapdata(stateContext, 
        stateContext.game.resourceManager.getBitmapData(resourceName), 
        isMovable: isMovable, addToStage: addToStage, 
        repeatMode: repeatMode, scaleMode: scaleMode
    );

  /**
   * Create a Background object from an image, which is inside a texture atlas(JSON).
   * 
   * * textureAtlasName: name of the texture atlas in the resourceManager
   * * resourceName: name of the resource in the texture atlas(image name without extension) 
   */
  Background.textureatlas(State stateContext, String resourceName,
      String textureAtlasName,  
      {bool isMovable: false, bool addToStage: true, 
       String repeatMode: DEFAULT_REPEAT_MODE, 
       String scaleMode: DEFAULT_SCALE_MODE}) 
    : this.bitmapdata( stateContext, 
      stateContext.game.resourceManager.getTextureAtlas(textureAtlasName)
        .getBitmapData(resourceName), 
      isMovable: isMovable, addToStage: addToStage, 
      repeatMode: repeatMode, scaleMode: scaleMode
    );

  addToStage() {
    _backgroundTileList.forEach((tile) {
      _context.game.stage.addChild(tile);
    });
    if (isMovable) {
      _context.game.stage.juggler.add(this);
    }
  }

  @override
  bool advanceTime(num time) {
    _backgroundTileList.forEach((tile) {
      tile.x = (tile.x + vx * time).round();
      tile.y = (tile.y + vy * time).round();
      
      if (vx > 0 && tile.x >= _context.game.stage.sourceWidth) {
          
        tile.x = (tile.x - _context.game.stage.sourceWidth - tile.width).round();
      
      } else if (vx < 0 && tile.x <= -tile.width) {
          
        tile.x = (tile.x + _context.game.stage.sourceWidth + tile.width).round();
        
      }
      
      if (vy > 0 && tile.y >= _context.game.stage.sourceHeight) {

        tile.y = (tile.y - _context.game.stage.sourceHeight - tile.height).round();

      } else if (vy < 0 && tile.y <= -tile.height) {
        
        tile.y = (tile.y + _context.game.stage.sourceHeight + tile.height).round(); 
        
      }
      
    });

  }
}
