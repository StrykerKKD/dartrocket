part of worldcamera;

class Play extends State {
  Play(String name) : super(name);
  
  int dist = 5;

  load() {
    game.resourceManager.addBitmapData('ship', 'playerShip1_blue.png');
    game.resourceManager.addBitmapData('background', 'space-wallpaper-3.jpg');
  }

  create() {
    game.add.background('background');
  }

  update() {
    if (game.keyboard.isDown(KeyCode.UP)) {
      game.camera.move('up', dist);
    }
    if (game.keyboard.isDown(KeyCode.DOWN)) {
      game.camera.move('down', dist);
    }
    if (game.keyboard.isDown(KeyCode.LEFT)) {
      game.camera.move('left', dist);
    }
    if (game.keyboard.isDown(KeyCode.RIGHT)) {
      game.camera.move('right', dist);
    }
  }

}
