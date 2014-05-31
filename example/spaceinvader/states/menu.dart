part of spaceinvader;

class Menu extends State {
  Menu(String name, [String nextState]): super(name, nextState);

  run() {

    Text titleText = new Text("SpaceInvader")
        ..x = 200
        ..y = 100
        ..defaultTextFormat.size = 56
        ..width = 600;

    String instructions = "You can move with left(<-) and right(->) cursor.\n Hit Space to play.";    
    Text instructionsText = new Text(instructions)
    ..x = 40
    ..y = 300
    ..defaultTextFormat.size = 28
    ..width = 800;

    game.stage.addChild(titleText);
    game.stage.addChild(instructionsText);
    
    const spaceBar = 32;
    game.stage.onKeyDown.listen((value){
      if(value.keyCode == spaceBar){
        game.stage.removeEventListeners("keyDown");
        killteState();
      }
    });
  }
}
