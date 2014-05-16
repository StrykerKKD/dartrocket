part of dartrocket;

/**
 * This interface is the most basic object.
 * */

abstract class Sprite extends StageXL.Bitmap {
  /**
   * Is the sprite alive?
   * */
  bool alive = false;
  
  Sprite(StageXL.BitmapData bitmapData, {int x:0, int y:0}): super(bitmapData) {
    this.x = x;
    this.y = y;
  }
  
  /**
   * Takes the pivot point to the center.
   * */
  void center(){
    pivotX = bitmapData.width / 2;
    pivotY = bitmapData.height / 2;
  }
}
