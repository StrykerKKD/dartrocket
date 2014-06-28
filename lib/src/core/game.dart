part of dartrocket;

/**
 * Game class is the main entry point of the game framework.
 * 
 * Game has built in members that helps you acces different classes through
 * your own Game object.
 * 
 * The Game is based on the stateManager,which helps you break up your game into 
 * states, so you wont have one big pile of code.
 * 
 * In your game's main Dart file you only have to deal with managing the states.
 *  
 * Your main file should look something like this:
 *     void main(){
 *       Game game = new Game("canvas");
 *       
 *       //Add states to the stateManager
 *       game.stateManager.addStateMap({
 *         "first": new First("first", "second"),
 *         "second": new Second("second", "third"),
 *         "third": new Third("third")
 *       });
 *       
 *       //Start the first state
 *       game.stateManager.initState("first");
 *     }
 *     
 * */

class Game {
  /**
   * The canvas element that we are using.
   * */
  CanvasElement canvas;
  /**
   * [StageXL.Stage] object
   * */
  StageXL.Stage stage;
  /**
   * [StageXL.RenderLoop] object
   * */
  StageXL.RenderLoop renderLoop;
  /**
   * [StageXL.ResourceManager] object
   * */
  StageXL.ResourceManager resourceManager;
  /**
   * [StateManager] object
   * */
  StateManager stateManager;
  
  GameObjectFactory add;
  /**
   * Creates a new Game object.
   * Parameters:
   * 
   * * canvasID: ID of the canvas without the #(hasmark)
   * * webGL: use WebGL renderer?
   * * framerate: framerate of the game
   * * color: backgroundcolor of the stage
   * * fullScreen: stage gets full screen and keeps the aspect ratio
   * */
  Game({int width: 800, int height: 600, bool webGL: false, int frameRate:
      30, int color: StageXL.Color.Black, bool fullScreen: false}) {

    canvas = new CanvasElement()
        ..setAttribute("screencanvas", "true")
        ..width = width
        ..height = height;
    document.body.children.add(canvas);

    if (fullScreen) {
      double scale = 1.0;
      double ratioWidth = (window.innerWidth) / width;
      double ratioHeight = (window.innerHeight) / height;
      scale = (ratioWidth < ratioHeight) ? ratioWidth : ratioHeight;

      canvas
          ..width = (scale * width).toInt()
          ..height = (scale * height).toInt();
    }

    stage = new StageXL.Stage(canvas, width: width, height: height, webGL:
        webGL, frameRate: frameRate, color: color);
    renderLoop = new StageXL.RenderLoop();
    resourceManager = new StageXL.ResourceManager();
    stateManager = new StateManager(this);
    add = new GameObjectFactory();

    stage.align = StageXL.StageAlign.NONE;
    stage.scaleMode = StageXL.StageScaleMode.SHOW_ALL;
    renderLoop.addStage(stage);

    if (StageXL.Multitouch.supportsTouchEvents) {
      StageXL.Multitouch.inputMode = StageXL.MultitouchInputMode.TOUCH_POINT;
    }

    stage.focus = stage;

  }

  /**
   * Adds a map of BitmapData to reasourceManager.
   * Example:
   *     game.addDataMap({"imageName":"imageUri"});
   * */
  void addDataMap(Map<String, String> dataMap) {
    dataMap.forEach((name, url) {
      resourceManager.addBitmapData(name, url);
    });
  }
}
