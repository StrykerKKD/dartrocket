part of statemachine;

class First extends State {
  First(String nextState) : super(nextState);

  create() {
    Text text = new Text(this, "First State")
        ..x = 300
        ..y = 300;
    
    print("$nextState");
    
    new Timer(new Duration(seconds: 3), killState);
  }
}
