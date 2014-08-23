part of gravity;

class Play extends State {

  Sprite player;

  load() {
    game.resourceManager.addBitmapData("blueCube", "blueCube80x80.png");
  }

  create() {

    game.physics
        ..garvitySpeed = 150
        ..setGravityDirection(Direction.DOWN);

    player = game.add.sprite("blueCube")
        ..x = 200
        ..y = 200
        ..speed = 200
        ..acceleration = 50
        ..minSpeed = 0
        ..maxSpeed = 400
        ..killOutOfBounds = true
        ..centerPivot();

  }

  update() {

    player.stop();
    player.stopSpeedChange();

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

    if (game.keyboard.isDown(KeyCode.J)) {
      player.speedUP();
    }
    if (game.keyboard.isDown(KeyCode.K)) {
      player.slowDown();
    }
  }
}
