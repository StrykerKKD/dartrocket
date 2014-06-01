part of spaceinvader;

class Play extends State {
  Play(String name, [String nextState]) : super(name, nextState);

  run() {
    Background bg = new Background(this, "background", isMoveable: true)
        ..vx = 100
        ..vy = 250;

    int score = 0;
    Text scoreText = new Text(this, "Score: $score", size: 20);

    Ship player = new Ship(this, "ship")
        ..center()
        ..x = 400
        ..y = 500
        ..vx = 300;


    Group<Sprite> bullets = new Group<Sprite>();
    for (int i = 0; i < 5; i++) {
      bullets.add(new Sprite(this, "bullet", addToStage: false, isMoveAble: true
          )
          ..center()
          ..vy = -500);
    }

    Ufo ufo;
    Group<Ufo> ufos = new Group<Ufo>();
    for (int j = 0; j < 2; j++) {
      for (int i = 0; i < 7; i++) {
        ufo = new Ufo(this, "ufo")
            ..x = (i * 100 + 10)
            ..y = 100 * j
            ..vy = 30
            ..alive = true;
        ufos.add(ufo);
      }
    }


    Sound laserSound = new Sound(this, "laser");


    const spaceBar = 32;
    const leftArrow = 37;
    const rightArrow = 39;


    Sprite bullet;
    Timer bulletTimer = new Timer.periodic(new Duration(milliseconds: 450), (_) {
      if (bullets.any((item) => !item.alive)) {
        bullet = bullets.firstWhere((item) => !item.alive)
            ..x = player.x
            ..y = player.y
            ..alive = true;

        bullet.addToStage();
        laserSound.play();
      }
    });

    game.stage.onKeyDown.listen((value) {
      switch (value.keyCode) {
        case leftArrow:
          player.movingLeft = true;
          break;
        case rightArrow:
          player.movingRight = true;
          break;
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
        bulletTimer.cancel();
        killteState();
      }

      ufos.forEachAlive((ufo) {
        bullets.forEachAlive((bullet) {
          if (ufo.hitTestObject(bullet)) {
            ufo.alive = false;
            bullet.removeFromStage();
            scoreText.text = "Score: ${score+=10}";
          }
        });
        if(ufo.hitTestObject(player)){
          game.stage.removeEventListeners("keyDown");
          bulletTimer.cancel();
          killteState();
        }
      });

    });
  }
}
