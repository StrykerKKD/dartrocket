part of dartrocket;

abstract class State extends Stream<String> {

  static const String PAUSE = "PAUSE";

  StreamController<String> _controller;
  String _name;
  String _nextState;
  Game game;

  State(this._name, [String nextState = null]): _nextState = nextState {
    _controller = new StreamController<String>(onListen: _onListen, onPause:
        _onPause, onResume: _onResume, onCancel: _onCancel);
  }

  StreamSubscription<String> listen(void onData(String line), {void
      onError(Error error), void onDone(), bool cancelOnError}) {
    return _controller.stream.listen(onData, onError: onError, onDone: onDone,
        cancelOnError: cancelOnError);
  }

  void _onListen() {
    print("Constructing");
    preload();
    game.resourceManager.load().then(create());
  }

  void _onPause() {
    print("Pause");
    game.stage.removeChildren();
    game.stage.juggler.clear();
  }

  void _onResume() {
    print("Resume");
    preload();
    game.resourceManager.load().then(create());
    

  }

  void _onCancel() {
    print("Deconstructing");
    game.stage.removeChildren();
    game.stage.juggler.clear();
  }

  preload() {}
  create() {}

  String get name => _name;

  String get nextState => _nextState;

  set nextState(state) => _nextState = state;

  void addMessage(message) {
    _controller.add(message);
  }

  void pauseStream() {
    _controller.add(PAUSE);
  }

  void closeStream() {
    _controller.close();
  }


}
