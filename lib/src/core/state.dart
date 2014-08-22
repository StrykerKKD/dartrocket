part of dartrocket;

/**
 * State is an absract class that represents a state of the game.
 * 
 * For using it you need to extend the state and call it's constructor, after that
 * you have to owerwrite the create() methode.
 * 
 * There 2 **important** methode that controls the state:
 * 
 * * endState: This methodes end the state, but we can come back to this state
 * * killState: This kills that state, so you can not return back to this state
 * 
 * **Important:** After you call terminateState you can never go back to this state.
 * If you want to return to a state use endState method.
 * 
 * **Important:** You can controll where you want to go with nextState method.
 * 
 * Example:
 *     class MyState extends State{
 *       //You only need constructor if you want to set the nextState with constructor
 *       //If you don't want it then you don't need to implement a constructor
 *       MyState(String nextState): super(nextState);
 *       
 *       load() {
 *        //loading stuff
 *       }
 *       
 *       create() {         
 *       
 *         //running stuff
 *         if(playerLost){
 *           //menu will be the next state and we can try again
 *           nextState = "menu";
 *           endState(); 
 *         }else{
 *           //player won so we go to the next level and never return
 *           terminateState("nextLevel");
 *         }
 *         
 *       }
 * 
 *       load() {
 *       
 *       }
 * 
 *     }
 * 
 * */

abstract class State {

  static const String _PAUSE = "PAUSE";

  StreamController<String> _controller;
  
  /**
   * The name of the State.
   */
  String name;

  /**
   * The next state's name.
   * 
   * **Important:** You can controll where you want to go with this member.
   */
  String nextState;

  /**
   * Acces to the main game object.
   * */
  Game game;

  /**
   * This will make a state.
   * 
   * Parameters:
   * 
   * * _name: the state's name
   * * nextState: next state's name(optional)
   * */
  State([String nextState]) : nextState = nextState {
    _controller = new StreamController<String>(
        onListen: _onListen,
        onPause: _onPause,
        onResume: _onResume,
        onCancel: _onCancel);
  }

  /**
   * Overwrite if you want to load resources.
   * */
  load() {}

  /**
   * Create game objects in this method.
   * 
   * It's called after load has completed.
   * 
   * ** You must overwrite this for using the state. ** 
   * */
  create();

  /**
   * Overwrite if you want do something in the loop.
   * 
   * It's called when an EnterFrame event happens on the world.
   */
  update() {}

  /**
   * You can send message to the StateManager.
   * */
  void addMessage(message) {
    _controller.add(message);
  }

  /**
   * This methodes end the state, but we can come back to this state
   * */
  void endState([String nextState]) {
    if (nextState != null) this.nextState = nextState;
    _controller.add(_PAUSE);
  }

  /**
   * This kills that state, so you can not return back to this state
   * */
  void killState([String nextState]) {
    if (nextState != null) this.nextState = nextState;
    _controller.close();
  }

  StreamSubscription<String> _start(void onData(String line), {void
      onError(Error error), void onDone(), bool cancelOnError}) {
    return _controller.stream.listen(
        onData,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError);
  }

  void _constructor() {
    load();
    game.resourceManager.load().then((_) {
      game.add.currentContext = game.stateManager.currentState;
      create();
      game.world.onEnterFrame.listen((_) {
        update();
        game.camera._update();
      });
    });
  }

  void _destructor() {
    game.add.currentContext = null;
    game.camera.removeChildren();
    game.world.removeChildren();
    game.world.juggler.clear();
    Event.ALL_EVENT.forEach((event) {
      //killing world eventlisteners
      if (game.world.hasEventListener(event)) {
        game.world.removeEventListeners(event);
      }
    });
  }

  void _onListen() {
    _constructor();
  }

  void _onPause() {
    _destructor();
  }

  void _onResume() {
    _constructor();
  }

  void _onCancel() {
    _destructor();
  }




}
