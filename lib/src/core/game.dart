part of dartrocket;

class Game {

  Element canvas;
  StageXL.Stage stage;
  StageXL.RenderLoop renderLoop;
  StageXL.ResourceManager resourceManager;
  StateManager stateManager;

  Game(String canvasID, {bool webGL: true}) {
    canvas = querySelector('#$canvasID');
    stage = new StageXL.Stage(canvas, webGL: webGL);
    renderLoop = new StageXL.RenderLoop();
    resourceManager = new StageXL.ResourceManager();
    stateManager = new StateManager(this);

    renderLoop.addStage(stage);

    stage.focus = stage;
  }
  
  void addDataMap(Map<String,String> dataMap){
    dataMap.forEach((name,url){
      resourceManager.addBitmapData(name, url);
    });
  }
}
