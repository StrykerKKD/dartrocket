part of statemachine;

class Second extends State {
  Second(String name, [String nextState]): super(name, nextState);
  
  static bool runned = false;
  
  run() {
    Text text = new Text("Second State")
        ..x = 400
        ..y = 300;
    game.stage.addChild(text);

    if(runned){
      new Timer(new Duration(seconds: 3), killteState);
    }else{
      runned = true;
      new Timer(new Duration(seconds: 3), endState);
    }
        
  }
}
