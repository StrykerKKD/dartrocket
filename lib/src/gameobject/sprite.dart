part of dartrocket;

/**
 * This interface is the most basic object.
 * */

abstract class Sprite extends StageXL.Bitmap {
  /**
   * Is the sprite alive?
   * */
  bool alive = false;
  
  /**
     * Creates a Sprite object.
     * 
     * * stateContext: context of the State, which this object is in
     * * resourceName: name of the resource for the sprite
     * 
     * */
  Sprite(State stateContext, String resourceName) : super(
      stateContext.game.resourceManager.getBitmapData(resourceName));

  /**
   * Takes the pivot point to the center.
   * */
  void center() {    
    pivotX = bitmapData.width / 2;
    pivotY = bitmapData.height / 2;
  }
}
