part of spaceinvader;

class Play extends State {
  Play(String name, [String nextState]): super(name, nextState);

  run() {
    Background background = new Background(800, 600, mainColor);

    Ship player = new Ship(game.resourceManager.getBitmapData("ship"), x: 400,
        y: 500);
       
    List<Bullet> bullets = new List<Bullet>();
    for(int i=0;i<5;i++){
      bullets.add(new Bullet(game.resourceManager.getBitmapData("bullet")));  
    }
    
    game.stage.addChild(background);
    game.stage.addChild(player);

    game.stage.juggler.add(player);
    
    const spaceBar = 32;
    const leftArrow = 37;
    const rightArrow = 39;
    
    Bullet bullet;
    
    game.stage.onKeyDown.listen((value) {
      switch (value.keyCode) {
        case leftArrow:
          player.movingLeft = true;
          break;
        case rightArrow:
          player.movingRight = true;
          break;
      }
      
      if(value.keyCode==spaceBar){
        bullet = bullets.firstWhere((item)=>!item.alive)
            ..x = player.x
            ..y = player.y           
            ..alive = true;
        
        game.stage.addChild(bullet);
        game.stage.juggler.add(bullet);
      }
      
    });

    game.stage.onKeyUp.listen((value) {
      switch (value.keyCode) {
        case leftArrow:
          player.movingLeft = false;
          break;
        case rightArrow:
          player.movingRight = false;
          break;
      }
    });

  }
}
