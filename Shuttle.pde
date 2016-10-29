class Shuttle {
  float x;
  float y;
  float radius = 20;
  float yVel = 7;
  
  
  Shuttle(float xpos, float ypos) {
    x = xpos;
    y = ypos;
  }
  
  void render() {
    imageMode(CENTER);
    image(spaceShip, x, y);
    imageMode(CORNER);
  }
  
  void moveUP() {
    if (y - 24 > 0) {
      y -= yVel;
    }
  }
  
  void moveDown() {
    if (y + 24 < height) {
      y += yVel;
    }
  }
  

}