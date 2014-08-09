part of dartrocket;

/**
 * Handling some keyboard events.
 */

class Keyboard {

  Game _game;

  Map<int, bool> _isDownMap = new Map<int, bool>();

  Keyboard(this._game);

  /**
   * Handling onKeyDown events for a key.
   * */
  void onKeyDown(int keyCode, Function handler) {
    _game.world.onKeyDown.listen((keyboardEvent) {
      if (keyboardEvent.keyCode == keyCode) {
        handler();
      }
    });
  }

  /**
   * Handling onKeyUp events for a key.
   * */
  void onKeyUp(int keyCode, Function handler) {
    _game.world.onKeyUp.listen((keyboardEvent) {
      if (keyboardEvent.keyCode == keyCode) {
        handler();
      }
    });
  }

  /**
   * Handling onDownKey and a onKeyUp events for a key.
   */
  void onKeyDownAndKeyUpHandler(int keyCode, Function downHandler,
      Function upHandler) {
    _game.world.onKeyDown.listen((keyboardEvent) {
      if (keyboardEvent.keyCode == keyCode) {
        downHandler();
      }
    });

    _game.world.onKeyUp.listen((keyboardEvent) {
      if (keyboardEvent.keyCode == keyCode) {
        upHandler();
      }
    });
  }

  /**
   * Is the key pressed down?
   */
  bool isDown(int keyCode) {
    if (!_isDownMap.containsKey(keyCode)) {
      _addIsDownListener(keyCode);
    }
    return _isDownMap[keyCode];
  }

  void _addIsDownListener(int keyCode) {
    _isDownMap[keyCode] = false;
    _game.world.onKeyDown.listen((keyboardEvent) {
      if (keyboardEvent.keyCode == keyCode) {
        _isDownMap[keyCode] = true;
      }
    });

    _game.world.onKeyUp.listen((keyboardEvent) {
      if (keyboardEvent.keyCode == keyCode) {
        _isDownMap[keyCode] = false;
      }
    });
  }
}
