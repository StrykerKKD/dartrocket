part of dartrocket;

class StateManager {

  Game _game;
  Map<String, State> _stateMap;
  Map<String, StreamSubscription> _subscriptionMap;
  State _currentState;
  StreamSubscription _currentSubscription;

  StateManager(this._game) {
    _stateMap = new Map<String, State>();
    _subscriptionMap = new Map<String, StreamSubscription>();
  }

  void addState(String name, State state) {
    state.game = _game;
    _stateMap[name] = state;
  }

  void addStateMap(Map<String, State> map) {
    map.forEach((_, state) {
      state.game = _game;
    });
    _stateMap.addAll(map);
  }

  void initState(String state) {
    _currentState = _stateMap[state];
    _currentSubscription = _currentState.listen(messageHandler, onDone:
        onDoneHandler);
    _subscriptionMap[_currentState.name] = _currentSubscription;
  }

  void messageHandler(message) {
    print("Message: $message");
    if (message == State.PAUSE) {
      new Future(_currentSubscription.pause).then(nextState);
    }
  }

  void onDoneHandler() {
    if (_currentState.nextState != null) {
      print("Next State");
      nextState(null);
    } else {
      print("The End");
    }
  }

  void nextState(_) {
    _currentState = _stateMap[_currentState.nextState];

    if (_subscriptionMap.containsKey(_currentState.name)) {
      _currentSubscription = _subscriptionMap[_currentState.name];
      if (_currentSubscription.isPaused) {
        _currentSubscription.resume();
      }
    } else {
      _currentSubscription = _currentState.listen(messageHandler, onDone:
          onDoneHandler);
      _subscriptionMap[_currentState.name] = _currentSubscription;
    }

  }

  void pauseState() {
    _currentSubscription.pause();
  }

  void resumeState() {
    _currentSubscription.resume();
  }


}
