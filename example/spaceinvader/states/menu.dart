part of spaceinvader;

class Menu extends State {
  Menu(String name, [String nextState]) : super(name, nextState);

  run() {
    
    Background background = new Background.color(this, color: Color.Aqua, 
        scaleMode: Background.SCALE_FULL_XY);

    Text titleText = new Text(this, "SpaceInvader")
        ..x = 200
        ..y = 100
        ..defaultTextFormat.size = 56
        ..width = 600;

    String instructions = "You can move with left(<-) and right(->) cursor.";
    Text instructionsText = new Text(this, instructions)
        ..x = 40
        ..y = 300
        ..defaultTextFormat.size = 28
        ..width = 800;

    Button btn2 = new Button.textureatlas(this, 'blue_button04', 'spaceinvader',
        'continue')
        ..x = 300
        ..y = 400
        ..onTouchEnd.listen((_) {
          killState();
        })
        ..onMouseClick.listen((_) {
          killState();
        });

  }
}
