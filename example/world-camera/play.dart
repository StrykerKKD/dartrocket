part of worldcamera;

class Play extends State {
  Play(String name) : super(name);

  load() {
    game.resourceManager.addBitmapData('ship', 'playerShip1_blue.png');
    game.resourceManager.addBitmapData('background', 'space-wallpaper-3.jpg');
  }

  create() {
    game.add.background('background');

    int dist = 10;

    game.keyboard.onKeyDown(KeyCode.UP, () => game.camera.move('up', dist));
    game.keyboard.onKeyDown(KeyCode.DOWN, () => game.camera.move('down', dist));
    game.keyboard.onKeyDown(KeyCode.LEFT, () => game.camera.move('left', dist));
    game.keyboard.onKeyDown(KeyCode.RIGHT, () => game.camera.move('right', dist));
  }

}
