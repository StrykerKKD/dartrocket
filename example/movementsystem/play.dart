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
        ..speedX = 200
        ..speedY = 200
        ..center();
  }

  @override
  update() {
    player.stop();
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
      player.rotate(-0.1);
    }
    if (game.keyboard.isDown(KeyCode.E)) {
      player.rotate(0.1);
    }
  }
}
