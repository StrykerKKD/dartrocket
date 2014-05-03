part of statemachine;

class First extends State {
  First(String name, [String nextState]): super(name, nextState);

  create() {
    Background background = new Background(800, 600, mainColor);
    Text text = new Text("First State")
        ..x = 400
        ..y = 300;
    game.stage.addChild(background);
    game.stage.addChild(text);

    new Timer(new Duration(seconds: 3), closeStream);
  }
}
