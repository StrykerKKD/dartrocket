part of spaceinvader;

class Menu extends State {

  create() {

    game.add.background('purple', repeatMode: Background.REPEAT_XY);
    
    game.add.text("SpaceInvader")
        ..x = 200
        ..y = 100
        ..defaultTextFormat.size = 56
        ..width = 600;

    game.add.text("You can move with left(<-) and right(->) cursor.")
        ..x = 40
        ..y = 300
        ..defaultTextFormat.size = 28
        ..width = 800;

    game.add.button('blue_button04', 'continue')
        ..x = 300
        ..y = 400
        ..onTouchEnd.listen((_) {
          killState("play");
        })
        ..onMouseClick.listen((_) {
          killState("play");
        });

  }
}
