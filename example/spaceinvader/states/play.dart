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


    game.stage.addChild(player);
    game.stage.juggler.add(player);

    List<Bullet> bullets = new List<Bullet>();
    for (int i = 0; i < 5; i++) {
      bullets.add(new Bullet(this, "bullet")..center()..vy=300);
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

    Bullet bullet;

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
        bullet = bullets.firstWhere((item) => !item.alive)
            ..x = player.x
            ..y = player.y
            ..alive = true;

        game.stage.addChild(bullet);
        game.stage.juggler.add(bullet);
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


    List<Bullet> aliveBulletList = new List<Bullet>();
    List<Ufo> aliveUfoList = new List<Ufo>();
    aliveUfoList.addAll(ufos.where((item) => item.alive));

    game.stage.onEnterFrame.listen((_) {
      if (aliveUfoList.length <= 0) {
        killteState();
      }

      aliveBulletList.addAll(bullets.where((item) => item.alive));

      aliveBulletList.forEach((bullet) {
        aliveUfoList.forEach((ufo) {
          if (ufo.hitTestObject(bullet)) {
            ufo.alive = false;
            bullet.alive = false;
          }
        });
      });

      aliveUfoList.removeWhere((item) => !item.alive);

    });

  }
}
