class Bar {
  float x, y, l, w;
  float decreaseSpeed;
  float mineralBoost;
  
  Bar() {
    x = 80;
    y = 40;
    l = 80;
    w = 13;
  }
  
  void render() {
    pushStyle();
    rectMode(CORNER);
    stroke(255,255,0);
    strokeWeight(3);
    noFill();
    rect(x, y, l, w);
    popStyle();
  }

}