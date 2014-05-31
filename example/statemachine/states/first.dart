part of statemachine;

class First extends State {
  First(String name, [String nextState]): super(name, nextState);

  run() {
    Text text = new Text(this,"First State")
        ..x = 400
        ..y = 300;

    new Timer(new Duration(seconds: 3), killteState);
  }
}
