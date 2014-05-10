part of spaceinvader;

class Play extends State {
  Play(String name, [String nextState]): super(name, nextState);

  create() {
    Background background = new Background(800, 600, mainColor);

    Ship player = new Ship(game.resourceManager.getBitmapData("ship"), x: 400,
        y: 500);


    game.stage.addChild(background);
    game.stage.addChild(player);

    game.stage.juggler.add(player);

    const leftArrow = 37;
    const rightArrow = 39;

    game.stage.onKeyDown.listen((value) {
      switch (value.keyCode) {
        case leftArrow:
          player.movingLeft = true;
          break;
        case rightArrow:
          player.movingRight = true;
          break;
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

  }
}
