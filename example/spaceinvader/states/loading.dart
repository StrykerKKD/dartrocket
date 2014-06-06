part of spaceinvader;

class Loading extends State {

  Loading(String name, [String nextState]): super(name, nextState);

  load() {

    Text text = new Text(this,"Loading...")
        ..x = 400
        ..y = 300;

    game.addDataMap({
      "ship": "images/playerShip1_blue.png",
      "ufo": "images/ufoRed.png",
      "bullet": "images/laserBlue01.png",
      "background":"images/purple.png",
      "buttonUp":"images/blue_button04.png",
      "buttonDown":"images/blue_button05.png",
      "leftButton":"images/flatDark23.png",
      "rightButton":"images/flatDark24.png"
    });
    
    game.resourceManager.addSound("laser", "sounds/sfx_laser1.ogg");
  }

  run() {
    //new Timer(new Duration(seconds: 1), killteState);
    killteState();
  }


}
