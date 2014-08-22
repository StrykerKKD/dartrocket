part of dartrocket;

/**
 * StateManager stores all of the [State]s and manage the flow of the game.
 * 
 * You only can only do 2 things with the statemanager:
 * 
 * * Add state(s)
 * * Start the first state
 * 
 * **Important:** The StateManager manages the flow of the game, 
 * but does not controll it. The Manager starts the next state based on the
 * current state's _nextState value.
 * This means that you can change the flow of the game in the current State.
 * 
 * Two events can happen when the StateManager changes the state:
 * 
 * * endState gets called from the current state
 * * killState gets called from the current state
 * 
 * If currentState.nextState's value is null then there will be no nextState and
 * it will be in a stateless state and the stage will turn to black.
 * 
 * You can see an example in [Game] class.
 * */

class StateManager {

  Game _game;
  
  // Stores the state in a map {state's name:state object}
  Map<String, State> _stateMap;
  
  //Stores the subscription's of the {state's name: state's subrisction} 
  Map<String, StreamSubscription> _subscriptionMap;
  
  State _currentState;
  
  StreamSubscription _currentSubscription;
  
  StateManager(this._game) {
    _stateMap = new Map<String, State>();
    _subscriptionMap = new Map<String, StreamSubscription>();
  }
  
  /**
   * Add a state to the state manager.
   * */
  void addState(String name, State state) {
    state.name = name;
    state.game = _game;
    _stateMap[name] = state;
  }

  /**
   * Add a map of states to the statemanager.
   * */
  void addStateMap(Map<String, State> map) {
    map.forEach((name, state) {
      addState(name,state);
    });
  }
  
  /**
   * Starts the first state.
   * */
  void initState(String state) {
    _currentState = _stateMap[state];
    _currentSubscription = _currentState._start(_messageHandler, onDone:
        _onDoneHandler);
    //new state so we add the state's subscription to the _subscriptionMap
    _subscriptionMap[_currentState.name] = _currentSubscription;
  }
  
  //Current state send a message through the stream
  void _messageHandler(message) {
    if (message == State._PAUSE) {
      new Future(_currentSubscription.pause).then(_nextState);
    }
  }
  
  //Call the _nextState if current state end or terminate
  void _onDoneHandler() {
    if (_currentState.nextState != null) {
      _nextState(null);
    }
  }
  
  /*
   * Explanation: The state is based on a Single-Subscription Stream and because
   * of it, ti can be listened only once, so we can not close it if we want to
   * re run the state again
   * When we end a state we only pause the stream, but to resume the state,
   * we need the stream subscription of the state
   * With the streamsubscription we can resume the stream,so
   * state become replayable
   * */
  
  //This changes the state based on 2 things:
  // - _stateMap
  // - _currentSubscription
  void _nextState(_) {
    //get the next state from the current state
    _currentState = _stateMap[_currentState.nextState];
    
    //if the next state was runned before
    if (_subscriptionMap.containsKey(_currentState.name)) {
      //get it's subscription
      _currentSubscription = _subscriptionMap[_currentState.name];
      //if the next state is still in end state
      if (_currentSubscription.isPaused) {
        //replay the state
        _currentSubscription.resume();
      }
    } else {
      _currentSubscription = _currentState._start(_messageHandler, onDone:
          _onDoneHandler);
      //new state so we add the state's subscription to the _subscriptionMap
      _subscriptionMap[_currentState.name] = _currentSubscription;
    }

  }
  
  State get currentState => _currentState; 
  
  //not used
  /*
  void pauseState() {
    _currentSubscription.pause();
  }

  void resumeState() {
    _currentSubscription.resume();
  }
  */

}
