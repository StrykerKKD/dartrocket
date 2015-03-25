part of test.core;

worldTest() {
  group("World constructor", () {
    const testWidth = 100;
    const testHeight = 100;
    Game game;
    World world;
    setUp(() {
      game = new Game();
      world = new World(game, testWidth, testHeight);
    });
    tearDown(() {
      world = null;
      game = null;
    });
    test("Check init values", () {
      expect(world.width, equals(testWidth));
      expect(world.height, equals(testHeight));

      expect(world.juggler, equals(game.stage.juggler));

      expect(world.parent, equals(game.stage));
    });
  });
}
