class Meteorite {
  float x;
  float y;
  float xVel;
  float xVariance = 20;
  
  Meteorite(float xpos, float ypos, float velocity) {
    x = xpos + random(-xVariance, xVariance);
    y = ypos;
    xVel = 7 * velocity;
  }
  
  void render() {
    image(meteorite, x, y);
  }
  
  void move() {
    x -= xVel;
  }
  
  boolean checkHit(Shuttle object) {
    return ((abs(x - object.x) < 25) && (abs(y - object.y) < 35));
  }
}