part of spaceinvader;

class Play extends State {
  Play(String name, [String nextState]) : super(name, nextState);

  int score;
  Text scoreText;

  Sprite player;
  Group<Sprite> bullets;
  Group<Ufo> ufos;

  Timer bulletTimer;

  create() {

    game.add.background(
        'purple',
        isMovable: true,
        repeatMode: Background.REPEAT_XY)
        ..vx = 100
        ..vy = 250;

    score = 0;
    scoreText = game.add.text("Score: $score", size: 20);

    player = game.add.sprite('playerShip1_blue')
        ..x = game.world.width ~/ 2
        ..y = game.world.height - 200
        ..speedX = 300;

    bullets = new Group<Sprite>();
    for (int i = 0; i < 5; i++) {
      bullets.add(game.add.sprite('laserBlue01', addToWorld: false)
          ..speedY = 500
          ..move('up'));
    }

    Ufo ufo;
    ufos = new Group<Ufo>();
    for (int j = 0; j < 1; j++) {
      for (int i = 0; i < 7; i++) {
        ufo = new Ufo.textureatlas(this, 'ufoRed', 'spaceinvader')
            ..x = (i * 100 + 10)
            ..y = 100 * j
            ..speedY = 30
            ..alive = true;
        ufos.add(ufo);
      }
    }


    Sound laserSound = game.add.sound("laser");

    Sprite bullet;
    bulletTimer = new Timer.periodic(new Duration(milliseconds: 450), (_) {
      if (bullets.any((item) => !item.alive)) {
        bullet = bullets.firstWhere((item) => !item.alive)
            ..x = player.x + player.width ~/ 2
            ..y = player.y
            ..alive = true;

        bullet.addToWorld();
        laserSound.play();
      }
    });


    /*player.speedX = 300;
    if (game.isMobile) {

      Button leftButton = game.add.button('flatDark23', 'L')
          ..x = 0
          ..y = game.world.height - 100;

      Button rightButton = game.add.button('flatDark24', 'R');
      rightButton
          ..x = game.world.width - rightButton.width.toInt()
          ..y = game.world.height - 100;

      game.touch.onTouchBeginAndEnd(
          leftButton,
          () => player.go('left'),
          () => player.stop('left'));

      game.touch.onTouchBeginAndEnd(
          rightButton,
          () => player.go('right'),
          () => player.stop('right'));

    } else {

      game.keyboard.onDownAndUpKeyHandler(
          KeyCode.LEFT,
          () => player.go('left'),
          () => player.stop('left'));

      game.keyboard.onDownAndUpKeyHandler(
          KeyCode.RIGHT,
          () => player.go('right'),
          () => player.stop('right'));

    }*/

  }

  update() {

    player.stop();
    if (game.keyboard.isDown(KeyCode.LEFT)) {
      player.move('left');
    } else if (game.keyboard.isDown(KeyCode.RIGHT)) {
      player.move('right');
    }


    if (!ufos.anyAlive()) {
      bulletTimer.cancel();
      killState();
    }

    game.physics.collison(ufos, bullets, (Ufo ufo, Sprite bullet) {
      ufo.alive = false;
      bullet.removeFromWorld();
      scoreText.text = "Score: ${score+=10}";
    });

    game.physics.collison(ufos, player, (Ufo ufo, Sprite player) {
      bulletTimer.cancel();
      killState();
    });
  }

}
