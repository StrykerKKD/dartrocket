part of dartrocket;

abstract class Sprite extends StageXL.Bitmap {
  bool alive = false;

  Sprite(StageXL.BitmapData bitmapData, {int x:0, int y:0}): super(bitmapData) {
    this.x = x;
    this.y = y;
  }
}
