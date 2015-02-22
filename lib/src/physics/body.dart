part of dartrocket.physics;

class Body {
  StageXL.Polygon _body;
  
  Body(List<StageXL.Point> points) {
    _body = new StageXL.Polygon(points);
  }
}