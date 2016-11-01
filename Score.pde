class Score {

  int points;
  int dist;
  String arrived = "Congratulations! You reached Mars!";
  String hit = "You got hit by a meteorite!";
  String noFuel = "You ran out of fuel!";
  String text;
  
  Score() {
    points = 0;
  }
  
  void render() {
    pushStyle();
    fill(255);
    textFont(font);
    textAlign(CENTER);
    textSize(20);
    text("distance to Mars", 100, 400);
    text(int(dist + spaceShuttle.radius), 100, 420);
    popStyle();
    fill(200,0,100);
    rect(10, 430, 150*((4*width - (spaceShuttle.x - spaceShuttle.radius) -dist)/(4*width - (spaceShuttle.x - spaceShuttle.radius))), 5);
    image(marsIcon, 160, 425);
  }
  
  void incrementPoints() {
    points ++;
  }
  
  void checkDistance(Shuttle shuttle, Mars mars) {
    dist = floor(mars.x - (shuttle.x + shuttle.radius));
  }
  
  void finalSay() {
    pushStyle();
    textFont(font);
    fill(0, 230);
    rect(25, 25, width - 50, height - 50);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(30);
    if (planetMars.stillNotThere() == true) {
      text("Game Over!", width/2, height/2 - 70);
    } else {
      text("You Won!", width/2, height/2 - 70);
    }
    text(congratulate(), width/2, height/2 - 10);
    popStyle();
  }
  
  String congratulate() {
    if (planetMars.stillNotThere() == false) {
      text = arrived;
    } else if (fuelMeter.fuelDepleted() == true) {
      text = noFuel;
    } else {
      text = hit;
    }
    return text;
  }
   
}