class Meter{
  float x, y, w, l;
  float decreaseSpeed;
  float mineralBoost;
  float fullMeter = 76.5;
  
  Meter() {
    x = 82;
    y = 42;
    l = fullMeter;
    w = 10;
  }

  void render() {
    pushStyle();
    rectMode(CORNER);
    noStroke();
    fill((fullMeter/l)*70,0,(l/fullMeter)*255);
    rect(x, y, l, w);
    popStyle();
  }
  
  void improve(float points) {
    l = min(l + points, 76.5);
  }
  
  void decrease(){
    l = max(0, l - .2);
  }
  
  boolean fuelDepleted() {
    return (l == 0);
  }
  
}