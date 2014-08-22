part of dartrocket;

/**
 * Handling some keyboard events.
 * 
 * Example:
 *      game.keyboard.onKeyDown(KeyCode.Space, (){
 *        player.jump();
 *      });
 *      
 *      //if handler function needs parameter
 *      game.keyboard.onKeyDownAndKeyUpHandler(KeyCode.W, 
 *        ()=>ship.speedUp(20), 
 *        ()=>ship.stopSpeeding());
 *      
 *      //if handler don't need parameter you can us it this way
 *      game.keyboard.onKeyDownAndKeyUpHandler(KeyCode.W, 
 *        ship.speedUp, 
 *        ship.stopSpeeding());
 * 
 *      //isDown is best used inside update loop in state
 *      update() {
 *        if(game.keyboard.isDown(KeyCode.Space)) {
 *          player.jump();
 *        }
 *      }
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
