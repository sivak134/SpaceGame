class Mars {
  float x, y;
  float radius = 200;
  float xVel = 1;
  
  Mars() {
    x = 3*(width);
    y = height/2;
  }
  
  void move() {
    if (x != width/2) {
      x -= xVel;
    }
  }
  
  boolean stillNotThere() {
    return (x != width/2);
  }
  
  void render() {
    pushStyle();
    fill(255,0,0);
    ellipse(x, y, radius * 2, radius * 2);
    popStyle();
  }
}