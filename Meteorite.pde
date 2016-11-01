class Meteorite {
  float x;
  float y;
  float xVel;
  float xVariance = 20;
  float yVel;
  float yVariance = 2;
  
  Meteorite(float xpos, float ypos, float velocity) {
    x = xpos + random(-xVariance, xVariance);
    y = ypos;
    xVel = 7 * velocity;
    // JL: yVel as a linear distribution between yVariance and -yVariance as a function of normalized y
    yVel = yVariance - 2 * yVariance * (y / height);
    
    // JL: optional 'random kick' as a function of normalized y too
    yVel += random(-2, 0) + yVariance * (y / height);    
  }
  
  void render() {
    image(meteorite, x, y);
  }
  
  void move() {
    x -= xVel;
    if (x < width + 40) {      
      y += yVel;
      //println("this position" + x);
      //println(yVel);
    }   
  }
  
  boolean checkHit(Shuttle object) {
    return ((abs(x - object.x) < 25) && (abs(y - object.y) < 35));
  }
}