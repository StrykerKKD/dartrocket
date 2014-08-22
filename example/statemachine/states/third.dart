part of statemachine;

class Third extends State {

  static bool runned = false;

  create() {

    Text text = new Text(this, "Third State")
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
