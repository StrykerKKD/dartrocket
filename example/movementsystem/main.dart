part of movementsystem;

void main() {
  Game game = new Game();

  game.stateManager.addState('play', new Play('play'));

  game.stateManager.initState('play');
}
