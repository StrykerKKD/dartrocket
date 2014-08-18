part of worldcamera;

class Play extends State {
  Play(String name) : super(name);

  Sprite player;

  load() {
    game.resourceManager.addBitmapData('ship', 'playerShip1_blue.png');
    game.resourceManager.addBitmapData('background', 'space-wallpaper-3.jpg');
  }

  create() {
    game.add.background('background');

    player = game.add.sprite('ship')
        ..speed = 200
        ..x = 200
        ..y = 200;
    
    game.camera.follow(player);
    
    game.keyboard.onKeyDown(KeyCode.SPACE, ()=>game.camera.unfollow());
  }

  update() {
    if (game.keyboard.isDown(KeyCode.UP)) {
      game.camera.moveDistance('up');
    }
    if (game.keyboard.isDown(KeyCode.DOWN)) {
      game.camera.moveDistance('down');
    }
    if (game.keyboard.isDown(KeyCode.LEFT)) {
      game.camera.moveDistance('left');
    }
    if (game.keyboard.isDown(KeyCode.RIGHT)) {
      game.camera.moveDistance('right');
    }

    
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
    
    
  }

}
