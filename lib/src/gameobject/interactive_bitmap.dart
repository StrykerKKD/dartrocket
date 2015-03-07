part of dartrocket.gameobject;


/**
 * It's a bitmap wich can have event listeners.
 *
 * Basically a [StageXL.Bitmap] class, wich extends [StageXL.InteractiveObject].
 */
abstract class InteractiveBitmap extends StageXL.InteractiveObject {

  StageXL.BitmapData bitmapData;

  InteractiveBitmap(this.bitmapData);

  @override
  StageXL.Rectangle<num> get bounds {
    return bitmapData == null ? new StageXL.Rectangle<num>(0.0, 0.0, 0.0, 0.0) : new StageXL.Rectangle<num>(0.0, 0.0, bitmapData.width, bitmapData.height);
  }

  @override
  StageXL.DisplayObject hitTestInput(num localX, num localY) {
    // We override the hitTestInput method for optimal performance.
    if (bitmapData == null) return null;
    if (localX < 0.0 || localX >= bitmapData.width) return null;
    if (localY < 0.0 || localY >= bitmapData.height) return null;
    return this;
  }

  @override
  void render(StageXL.RenderState renderState) {
    if (bitmapData != null) bitmapData.render(renderState);
  }
  
  /**
   * Put the pivot point into the center of the sprite.
   */
  void centerPivot() {
      pivotX = bitmapData.width / 2;
      pivotY = bitmapData.height / 2;
    }
}
