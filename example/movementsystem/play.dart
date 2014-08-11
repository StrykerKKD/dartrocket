part of movementsystem;

class Play extends State {
  Play(String name) : super(name);

  Sprite player;

  @override
  load() {
    game.resourceManager.addBitmapData('playerShip', 'playerShip1_blue.png');
  }

  @override
  create() {
    player = game.add.sprite('playerShip')
        ..x = game.world.width ~/ 2
        ..y = game.world.height ~/ 2
        ..speed = 200
        ..acceleration = 50
        ..minSpeed = 0
        ..maxSpeed = 300
        ..checkWorldBounds = true
        ..center();

    game.keyboard.onKeyDownAndKeyUpHandler(
        KeyCode.J,
        player.speedUP,
        player.stopSpeedChange);
    game.keyboard.onKeyDownAndKeyUpHandler(
        KeyCode.K,
        player.slowDown,
        player.stopSpeedChange);
  }

  @override
  update() {
    player.stop();
    //player.stopSpeedChange();

    if (game.keyboard.isDown(KeyCode.W)) {
      player.move('forward');
    }
    if (game.keyboard.isDown(KeyCode.S)) {
      player.move('backward');
    }
    if (game.keyboard.isDown(KeyCode.A)) {
      player.move('left');
    }
    if (game.keyboard.isDown(KeyCode.D)) {
      player.move('right');
    }

    if (game.keyboard.isDown(KeyCode.Q)) {
      player.rotateAngles(-5);
    }
    if (game.keyboard.isDown(KeyCode.E)) {
      player.rotateAngles(5);
    }

    /*if (game.keyboard.isDown(KeyCode.J)) {
      player.speedUP();
    }
    if (game.keyboard.isDown(KeyCode.K)) {
      player.slowDown();
    }*/
  }
}
