class Coin {
  float x;
  float y;
  float xVel = 3;
  float xVariance = 20;
  boolean special;
  
  Coin(float xpos, float ypos, boolean blueMeteorite) {
    x = xpos + random(-xVariance, xVariance);
    y = ypos;
    special = blueMeteorite;
  }
  
  void render() {
    if (special) {
      image(specialMineral, x, y);
    } else {
      image(mineral, x, y);
    }
  }
  
  void move() {
    x -= xVel;
  }
  
  void checkHit(Shuttle object, Score score, Meter fuelMeter, boolean special) {
    //can make this more programmatic
    if ((abs(x - object.x) < 25) && (abs(y - object.y) < 33)) {
      x += width;
      score.incrementPoints();
      if (special) {
        fuelMeter.improve(18);
      } else {
        fuelMeter.improve(10);
      }
    }
  }
}