part of statemachine;

class Second extends State {
  Second(String name, [String nextState]): super(name, nextState);
  
  static bool runned = false;
  
  run() {
    Text text = new Text(this,"Second State")
        ..x = 300
        ..y = 300;

    if(runned){
      new Timer(new Duration(seconds: 3), killState);
    }else{
      runned = true;
      new Timer(new Duration(seconds: 3), endState);
    }
        
  }
}
