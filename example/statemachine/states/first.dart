part of statemachine;

class First extends State {
  First(String name, [String nextState]): super(name, nextState);

  create() {
    Text text = new Text(this,"First State")
        ..x = 300
        ..y = 300;

    new Timer(new Duration(seconds: 3), killState);
  }
}
