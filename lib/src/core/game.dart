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
 *       Game game = new Game();
 *       
 *       //Add states to the stateManager
 *       game.stateManager.addStateMap({
 *         "first": new First("second"),
 *         "second": new Second("third"),
 *         "third": new Third()
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

  /**
   * [GameObjectFactory] object
   */
  GameObjectFactory add;

  /**
   * [Physics] object
   */
  Physics physics;

  /**
   * [World] object
   */
  World world;

  /**
   * [Camera] object
   */
  Camera camera;

  /**
   * [Keyboard] object
   */
  Keyboard keyboard;

  /**
   * [Touch] object
   */
  Touch touch;

  /**
   * Creates a new Game object.
   * Parameters:
   * 
   * * width: width of the canvas
   * * height: height of the canvas
   * * webGL: use WebGL renderer?
   * * framerate: framerate of the game
   * * color: backgroundcolor of the stage
   * * fullScreen: stage gets full screen and keeps the aspect ratio
   * * minScale: lower limit of the scale value (used, when fullScreen is true) default value:0.8
   * * maxScale: upper limit of the scale value (used, when fullScreen is true) default value:1.2
   * */
  Game({int width: 800, int height: 600, bool webGL: false, int frameRate: 30,
      int color: StageXL.Color.Black, bool fullScreen: false, num minScale: 0.8,
      num maxScale: 1.2}) {

    if (fullScreen) {
      
      double ratioWidth = (window.innerWidth) / width;
      double ratioHeight = (window.innerHeight) / height;
      double scale = (ratioWidth < ratioHeight) ? ratioWidth : ratioHeight;
      
      if(scale < minScale) scale = minScale;
      if(scale > maxScale) scale = maxScale;
      
      width = (scale * width).toInt();
      height = (scale * height).toInt();
    }

    canvas = new CanvasElement()
        ..setAttribute("screencanvas", "true")
        ..width = width
        ..height = height;
    document.body.children.add(canvas);

    stage = new StageXL.Stage(
        canvas,
        width: width,
        height: height,
        webGL: webGL,
        frameRate: frameRate,
        color: color);
    
    renderLoop = new StageXL.RenderLoop();
    resourceManager = new StageXL.ResourceManager();
    stateManager = new StateManager(this);
    add = new GameObjectFactory();
    physics = new Physics();
    world = new World(this, width, height);
    camera = new Camera(this, world);
    keyboard = new Keyboard(this);
    touch = new Touch(this);

    stage.align = StageXL.StageAlign.NONE;
    stage.scaleMode = StageXL.StageScaleMode.SHOW_ALL;
    renderLoop.addStage(stage);

    if (StageXL.Multitouch.supportsTouchEvents) {
      StageXL.Multitouch.inputMode = StageXL.MultitouchInputMode.TOUCH_POINT;
    }

    stage.focus = world;

  }

  bool get autoHiDpi => StageXL.Stage.autoHiDpi;
  
  /**
   * Is the device a mobile?
   */
  bool get isMobile => StageXL.Stage.isMobile;
  
  /**
   * Give back the pixel ratio.
   */
  num get devicePixelRatio => StageXL.Stage.devicePixelRatio;
}
