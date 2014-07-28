part of dartrocket;

class Keyboard {

  Game _game;

  Map<int, bool> _isDownMap = new Map<int, bool>();

  Keyboard(this._game);


  void onDownAndUpKeyHandler(int keyCode, Function downHandler,
      Function upHandler) {
    _game.world.onKeyDown.listen((keyboarEvent) {
      if (keyboarEvent.keyCode == keyCode) {
        downHandler();
      }
    });

    _game.world.onKeyUp.listen((keyboarEvent) {
      if (keyboarEvent.keyCode == keyCode) {
        upHandler();
      }
    });
  }

  bool isDown(int keyCode) {
    if (!_isDownMap.containsKey(keyCode)) {
      _addIsDownListener(keyCode);
    }
    return _isDownMap[keyCode];
  }

  void _addIsDownListener(int keyCode) {
    _isDownMap[keyCode] = false;
    _game.world.onKeyDown.listen((keyboarEvent) {
      if (keyboarEvent.keyCode == keyCode) {
        _isDownMap[keyCode] = true;
      }
    });

    _game.world.onKeyUp.listen((keyboarEvent) {
      if (keyboarEvent.keyCode == keyCode) {
        _isDownMap[keyCode] = false;
      }
    });
  }
}
