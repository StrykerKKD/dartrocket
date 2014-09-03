part of movementsystem;

class Play extends State {

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
        ..collideWorldBounds = true
        ..centerPivot();

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
      player.move(Direction.UP);
    }
    if (game.keyboard.isDown(KeyCode.S)) {
      player.move(Direction.DOWN);
    }
    if (game.keyboard.isDown(KeyCode.A)) {
      player.move(Direction.LEFT);
    }
    if (game.keyboard.isDown(KeyCode.D)) {
      player.move(Direction.RIGHT);
    }

    if (game.keyboard.isDown(KeyCode.Q)) {
      player.move(Direction.UPLEFT);
    }
    if (game.keyboard.isDown(KeyCode.E)) {
      player.move(Direction.UPRIGHT);
    }
    if (game.keyboard.isDown(KeyCode.Y)) {
      player.move(Direction.DOWNLEFT);
    }
    if (game.keyboard.isDown(KeyCode.X)) {
      player.move(Direction.DOWNRIGHT);
    }

    if (game.keyboard.isDown(KeyCode.J)) {
      player.rotateAngles(-5);
    }
    if (game.keyboard.isDown(KeyCode.K)) {
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
