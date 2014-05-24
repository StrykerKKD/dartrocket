part of spaceinvader;

class Play extends State {
  Play(String name, [String nextState]) : super(name, nextState);

  run() {
    Background background = new Background(800, 600, mainColor);
    game.stage.addChild(background);

    Ship player = new Ship(this, "ship")
        ..center()
        ..x = 400
        ..y = 500
        ..vx = 200;


    List bullets = new List();
    for (int i = 0; i < 5; i++) {
      bullets.add(new FullSprite(this, "bullet", addToStage: false, isMoveAble:
          true)
          ..center()
          ..vy = 300);
    }

    /*Group<Bullet> bulletGroup = new Group<Bullet>();
    bulletGroup.addChildByFunction(()=> new Bullet(game.resourceManager.getBitmapData("bullet")));
    print(bulletGroup.getChildAt(0));*/

    Ufo ufo;
    List<Ufo> ufos = new List<Ufo>();
    for (int i = 1; i < 8; i++) {
      ufo = new Ufo(this, "ufo")
          ..center()
          ..x = (i * 100)
          ..y = 50
          ..vy = 50
          ..alive = true;
      ufos.add(ufo);
      game.stage.addChild(ufo);
      game.stage.juggler.add(ufo);
    }


    const spaceBar = 32;
    const leftArrow = 37;
    const rightArrow = 39;

    FullSprite bullet;

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


    List<FullSprite> aliveBulletList = new List<FullSprite>();
    List<Ufo> aliveUfoList = new List<Ufo>();
    aliveUfoList.addAll(ufos.where((item) => item.alive));

    game.stage.onEnterFrame.listen((_) {
      if (aliveUfoList.length <= 0) {
        game.stage.removeEventListeners("keyDown");
        killteState();
      }

      aliveBulletList.addAll(bullets.where((item) => item.alive));

      aliveBulletList.forEach((bullet) {
        aliveUfoList.forEach((ufo) {
          if (ufo.hitTestObject(bullet)) {
            ufo.alive = false;
            bullet.removeFromStage();
          }
        });
      });

      aliveUfoList.removeWhere((item) => !item.alive);

    });

  }
}
