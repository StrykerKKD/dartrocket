part of mygame;

class Play extends State {
  Play(String name,[String nextState]) : super(name,nextState);

  load() {
    //loading resources here(image,sound, textureatlas etc..)
  }

  create() {
    //create gameobjects and event handlers  
  }
  
  update() {
    //game loop: usually for handling physics and input events(moving the player)
  }
}
