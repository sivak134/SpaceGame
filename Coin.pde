class Coin {
  float x;
  float y;
  float xVel = 3;
  float xVariance = 20;
  
  Coin(float xpos, float ypos) {
    x = xpos + random(-xVariance, xVariance);
    y = ypos;
  }
  
  void render() {
    image(money, x, y);
  }
  
  void move() {
    x -= xVel;
  }
  
  void checkHit(Shuttle object, Score score) {
    //can make this more programmatic
    if ((abs(x - object.x) < 25) && (abs(y - object.y) < 33)) {
      x += width;
      score.incrementPoints();
    }
  }
}