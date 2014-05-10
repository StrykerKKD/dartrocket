part of spaceinvader;

class Loading extends State {

  Loading(String name, [String nextState]): super(name, nextState);

  preload() {

    Background background = new Background(800, 600, mainColor);

    Text text = new Text("Loading...")
        ..x = 400
        ..y = 300;

    game.stage.addChild(background);
    game.stage.addChild(text);

    game.addDataMap({
      "ship": "images/playerShip1_blue.png",
      "ufo": "images/ufoRed.png",
      "bullet": "images/laserBlue01.png"
    });
  }

  create() {
    new Timer(new Duration(seconds: 1), closeStream);
  }


}
