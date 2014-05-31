part of statemachine;

class Third extends State {
  Third(String name, [String nextState]): super(name, nextState);

  static bool runned = false;

  run() {
    
    Text text = new Text("Third State")
        ..x = 400
        ..y = 300;
    game.stage.addChild(text);

    if (runned) {
      nextState = null;
      new Timer(new Duration(seconds: 3), killteState);
    } else {
      runned = true;
      nextState = "second";
      new Timer(new Duration(seconds: 3), endState);
    }
  }
}
