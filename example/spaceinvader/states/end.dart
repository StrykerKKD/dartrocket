part of spaceinvader;

class End extends State {
  End(String name): super(name);

  run() {
    Background background = new Background(800, 600, mainColor);

    Text text = new Text("The End. Bye Bye")
        ..x = 400
        ..y = 300;

    game.stage.addChild(background);
    game.stage.addChild(text);
    
    new Timer(new Duration(seconds: 5),killteState);
  }

}
