part of statemachine;

class Third extends State {
  Third(String name, [String nextState]): super(name, nextState);

  static bool runned = false;

  run() {
    
    Text text = new Text(this,"Third State")
        ..x = 300
        ..y = 300;

    if (runned) {
      nextState = null;
      new Timer(new Duration(seconds: 3), killState);
    } else {
      runned = true;
      nextState = "second";
      new Timer(new Duration(seconds: 3), endState);
    }
  }
}
