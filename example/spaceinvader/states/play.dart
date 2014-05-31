part of spaceinvader;

class Play extends State {
  Play(String name, [String nextState]) : super(name, nextState);

  run() {
    Background bg = new Background(this, "background");
    
    Ship player = new Ship(this, "ship")
        ..center()
        ..x = 400
        ..y = 500
        ..vx = 200;


    Group<Sprite> bullets = new Group<Sprite>();
    for (int i = 0; i < 5; i++) {
      bullets.add(new Sprite(this, "bullet", addToStage: false, isMoveAble: true)
          ..center()
          ..vy = 300);
    }

    Ufo ufo;
    Group<Ufo> ufos = new Group<Ufo>();
    for (int i = 1; i < 8; i++) {
      ufo = new Ufo(this, "ufo")
          ..center()
          ..x = (i * 100)
          ..y = 50
          ..vy = 50
          ..alive = true;
      ufos.add(ufo);
    }


    const spaceBar = 32;
    const leftArrow = 37;
    const rightArrow = 39;

    Sprite bullet;

    int playerSpeed = 200;
    game.stage.onKeyDown.listen((value) {
      switch (value.keyCode) {
        case leftArrow:
          player.movingLeft = true;
          break;
        case rightArrow:
          player.movingRight = true;
          break;
      }

      if (value.keyCode == spaceBar) {
        if (bullets.any((item) => !item.alive)) {
          bullet = bullets.firstWhere((item) => !item.alive)
              ..x = player.x
              ..y = player.y
              ..alive = true;

          bullet.addToStage();
        }
      }

    });

    game.stage.onKeyUp.listen((value) {
      switch (value.keyCode) {
        case leftArrow:
          player.movingLeft = false;
          break;
        case rightArrow:
          player.movingRight = false;
          break;
      }
    });

    game.stage.onEnterFrame.listen((_) {
      
      if (!ufos.anyAlive()) {
        game.stage.removeEventListeners("keyDown");
        killteState();
      }

      ufos.forEachAlive((ufo) {
        bullets.forEachAlive((bullet) {
          if (ufo.hitTestObject(bullet)) {
            ufo.alive = false;
            bullet.removeFromStage();
          }
        });
      });

    });
  }
}
