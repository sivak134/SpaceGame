class Mars {
  float x, y;
  float radius = 200;
  float xVel = 1;
  
  Mars() {
    x = 4*(width);
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
    imageMode(CENTER);
    image(mars, x, y);
    popStyle();
  }
}