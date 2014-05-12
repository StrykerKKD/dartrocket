part of spaceinvader;

class Menu extends State {
  Menu(String name, [String nextState]): super(name, nextState);

  run() {
    Background background = new Background(800, 600, mainColor);

    Text titleText = new Text("SpaceInvader")
        ..x = 200
        ..y = 100
        ..defaultTextFormat.size = 56
        ..width = 600;

    String instructions = "You can move with left(<-) and right(->) cursor.\n Hit Space to play.";    
    Text instructionsText = new Text(instructions)
    ..x = 50
    ..y = 300
    ..defaultTextFormat.size = 28
    ..width = 600;

    game.stage.addChild(background);
    game.stage.addChild(titleText);
    game.stage.addChild(instructionsText);
    
    const spaceBar = 32;
    game.stage.onKeyDown.listen((value){
      if(value.keyCode == spaceBar){
        game.stage.removeEventListeners("keyDown");
        closeStream();
      }
    });
  }
}
