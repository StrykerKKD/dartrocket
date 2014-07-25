part of dartrocket;

class Keyboard {

  Game _game;

  Keyboard(this._game);

  void downAndUpKeyHandler(keyCode, Function downHandler, Function upHandler) {
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
}
