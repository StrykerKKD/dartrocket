part of test.core;

gameTest() {
  group("Game constructor", () {
    Game game;
    setUp((){
      game = new Game();
    });
    tearDown((){
      game = null;
    });
    test("Instance of", () {
      expect(game.canvas, new isInstanceOf<CanvasElement>());

      expect(game.stage, new isInstanceOf<StageXL.Stage>());
      expect(game.renderLoop, new isInstanceOf<StageXL.RenderLoop>());
      expect(game.resourceManager, new isInstanceOf<StageXL.ResourceManager>());

      expect(game.stateManager, new isInstanceOf<StateManager>());
      expect(game.add, new isInstanceOf<GameObjectFactory>());
      expect(game.physics, new isInstanceOf<PhysicsSystem>());
      expect(game.world, new isInstanceOf<World>());
      expect(game.camera, new isInstanceOf<Camera>());
      expect(game.keyboard, new isInstanceOf<Keyboard>());
      expect(game.touch, new isInstanceOf<Touch>());
    });
    test("Default settings", () {
      expect(game.canvas.attributes["screencanvas"] == "true", isTrue);
      expect(game.canvas.width, equals(Game.DEFAULT_WIDTH));
      expect(game.canvas.height, equals(Game.DEFAULT_HEIGHT));

      expect(game.stage.align, equals(StageXL.StageAlign.NONE));
      expect(game.stage.scaleMode, equals(StageXL.StageScaleMode.SHOW_ALL));
      expect(game.stage.focus, equals(game.world));
    });
    //TODO: Why does this work? Need to make it better.
    test("Fullscreen", () {
      game = new Game(fullScreen:true);
      expect(game.canvas.width, equals(Game.DEFAULT_WIDTH * Game.DEFAULT_MIN_SCALE));
      expect(game.canvas.height, equals(Game.DEFAULT_HEIGHT * Game.DEFAULT_MIN_SCALE));
    });
  });
}