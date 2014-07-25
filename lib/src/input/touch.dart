part of dartrocket;

class Touch {

  Game _game;

  Touch(this._game);

  void onTouchBeginAndEnd(gameObject, Function touchBegin, Function touchEnd) {
    gameObject.onTouchBegin.listen((_) {
      touchBegin();
    });
    gameObject.onTouchEnd.listen((_) {
      touchEnd();
    });
  }
}
