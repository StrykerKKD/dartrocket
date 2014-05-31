part of spaceinvader;

class End extends State {
  End(String name): super(name);

  run() {

    Text text = new Text("The End. Bye Bye")
        ..x = 400
        ..y = 300
        ..width = 500;

    game.stage.addChild(text);
    
    new Timer(new Duration(seconds: 5),killteState);
  }

}
