part of dartrocket;

/**
 * It's a bitmap wich can have event listeners.
 * 
 * This is used by the [Sprite] class and it's only a helper class.
 */
abstract class InteractiveBitmap extends StageXL.InteractiveObject {

  StageXL.BitmapData bitmapData;

  InteractiveBitmap(this.bitmapData);

  StageXL.Rectangle<num> getBoundsTransformed(StageXL.Matrix
      matrix, [StageXL.Rectangle<num> returnRectangle]) {
    var width = bitmapData != null ? bitmapData.width : 0;
    var height = bitmapData != null ? bitmapData.height : 0;
    return _getBoundsTransformedHelper(matrix, width, height, returnRectangle);
  }

  StageXL.DisplayObject hitTestInput(num localX, num localY) {
    return bitmapData != null && localX >= 0.0 && localY >= 0.0 && localX <
        bitmapData.width && localY < bitmapData.height ? this : null;
  }

  void render(StageXL.RenderState renderState) {
    if (bitmapData != null) bitmapData.render(renderState);
  }

  StageXL.Rectangle _getBoundsTransformedHelper(StageXL.Matrix matrix, num
      width, num height, StageXL.Rectangle<num> returnRectangle) {

    width = width.toDouble();
    height = height.toDouble();

    // tranformedX = X * matrix.a + Y * matrix.c + matrix.tx;
    // tranformedY = X * matrix.b + Y * matrix.d + matrix.ty;

    num x1 = 0.0;
    num y1 = 0.0;
    num x2 = width * matrix.a;
    num y2 = width * matrix.b;
    num x3 = width * matrix.a + height * matrix.c;
    num y3 = width * matrix.b + height * matrix.d;
    num x4 = height * matrix.c;
    num y4 = height * matrix.d;

    num left = x1;
    if (left > x2) left = x2;
    if (left > x3) left = x3;
    if (left > x4) left = x4;

    num top = y1;
    if (top > y2) top = y2;
    if (top > y3) top = y3;
    if (top > y4) top = y4;

    num right = x1;
    if (right < x2) right = x2;
    if (right < x3) right = x3;
    if (right < x4) right = x4;

    num bottom = y1;
    if (bottom < y2) bottom = y2;
    if (bottom < y3) bottom = y3;
    if (bottom < y4) bottom = y4;

    if (returnRectangle != null) {
      returnRectangle.setTo(matrix.tx + left, matrix.ty + top, right - left,
          bottom - top);
    } else {
      returnRectangle = new StageXL.Rectangle<num>(matrix.tx + left, matrix.ty +
          top, right - left, bottom - top);
    }

    return returnRectangle;
  }
}
