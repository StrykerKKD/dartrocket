part of spaceinvader;

class End extends State {
  End(String name): super(name);

  create() {
    
    new Background.color(this, color: Color.Beige, scaleMode: Background.SCALE_FULL_XY);
    
    game.add.text("The End. Bye Bye")
        ..x = 300
        ..y = 300
        ..width = 500;
    
    new Timer(new Duration(seconds: 5),killState);
  }

}
