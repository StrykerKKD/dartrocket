part of statemachine;

class First extends State {
  First(String name, [String nextState]): super(name, nextState);

  run() {
    Text text = new Text("First State")
        ..x = 400
        ..y = 300;
    game.stage.addChild(text);

    new Timer(new Duration(seconds: 3), killteState);
  }
}
