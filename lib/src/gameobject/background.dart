part of dartrocket;

class Background {
  List _backgroundTileList = new List();
  State _context;

  Background(State stateContext, String resourceName, {bool addToStage:
      true, bool repeatX: true, bool repeatY: true}) : super() {
    
    _context = stateContext;
    
    StageXL.BitmapData backgroundTileBitmapdata =
        stateContext.game.resourceManager.getBitmapData(resourceName);
    StageXL.Bitmap backgroundTileBitmap;

    int yTimes = (_context.game.stage.sourceHeight / backgroundTileBitmapdata.height).ceil();
    int xTimes = (_context.game.stage.sourceWidth / backgroundTileBitmapdata.width).ceil();

    for (int i = 0; i < yTimes; i++) {
      for (int j = 0; j < xTimes; j++) {
        backgroundTileBitmap = new StageXL.Bitmap(backgroundTileBitmapdata);
        backgroundTileBitmap
        ..x = backgroundTileBitmap.width * j
        ..y = backgroundTileBitmap.height * i;
        _backgroundTileList.add(backgroundTileBitmap);
      }
    }
    
    if (addToStage) {
      this.addToStage();
    }
  }

  addToStage() {
    _backgroundTileList.forEach((tile){
      _context.game.stage.addChild(tile);
    });    
  }
}
