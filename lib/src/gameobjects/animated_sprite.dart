part of dartrocket;

abstract class AnimatedSprite extends Sprite implements StageXL.Animatable {
  num vx, vy;

  AnimatedSprite(StageXL.BitmapData bitmapData, {int vx: 0, int vy: 0, 
    int x: 0, int y: 0}): super(bitmapData, x: x, y: y) {
    this.vx = vx;
    this.vy = vy;
  }
}
