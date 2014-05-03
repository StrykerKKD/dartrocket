part of statemachine;

class Second extends State {
  Second(String name, [String nextState]): super(name, nextState);
  
  static bool runned = false;
  
  create() {
    Background background = new Background(800, 600, mainColor);
    Text text = new Text("Second State")
        ..x = 400
        ..y = 300;
    game.stage.addChild(background);
    game.stage.addChild(text);

    if(runned){
      new Timer(new Duration(seconds: 3), closeStream);
    }else{
      runned = true;
      new Timer(new Duration(seconds: 3), pauseStream);
    }
        
  }
}
