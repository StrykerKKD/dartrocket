part of dartrocket;

/**
 * Handling a special touch event.
 */

class Touch {

  Game _game;

  Touch(this._game);
  
  /**
   * Handling onTouchBegin and onTouchEnd events for a gameobject.
   */
  void onTouchBeginAndEnd(gameObject, Function touchBegin, Function touchEnd) {
    gameObject.onTouchBegin.listen((_) {
      touchBegin();
    });
    gameObject.onTouchEnd.listen((_) {
      touchEnd();
    });
  }
}
