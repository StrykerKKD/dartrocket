part of dartrocket.core;

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
   * [PhysicsSystem] object
   */
  PhysicsSystem physics;

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

//=============================================================================

  static const int DEFAULT_WIDTH = 800;
  static const int DEFAULT_HEIGHT = 600;
  static const bool DEFAULT_WEBGL = false;
  static const int DEFAULT_FRAMERATE = 30;
  static const int DEFAULT_COLOR = StageXL.Color.Black;
  static const bool DEFAULT_FULLSCREEN = false;
  static const num DEFAULT_MIN_SCALE = 0.8;
  static const num DEFAULT_MAX_SCALE = 1.2;

  //=============================================================================

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
  Game({int width: DEFAULT_WIDTH, int height: DEFAULT_HEIGHT, bool webGL: DEFAULT_WEBGL, int frameRate: DEFAULT_FRAMERATE,
      int color: DEFAULT_COLOR, bool fullScreen: DEFAULT_FULLSCREEN, num minScale: DEFAULT_MIN_SCALE,
      num maxScale: DEFAULT_MAX_SCALE}) {

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
    //TODO: Put canvas in the middle of the screen
    /*canvas
        ..style.paddingLeft = "${(window.innerWidth - width) ~/ 2}px"
        ..style.paddingTop = "${(window.innerHeight - height) ~/ 2}px";*/
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
    physics = new PhysicsSystem();
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

//=============================================================================

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
