part of dartrocket;

class Background extends StageXL.Bitmap {
  num _width, _height;
  num _color;

  Background(this._width, this._height, this._color): super() {
    bitmapData = new StageXL.BitmapData(_width, _height, false, _color);
  }
}
