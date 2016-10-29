class Score {

  int points;
  String good = "Your coin count: not bad!";
  String bad = "You didn't get many coins... maybe next time.";
  String great = "Great job! You accumulated lots of coins!";
  String text;
  
  Score() {
    points = 0;
  }
  
  void render() {
    pushStyle();
    fill(255);
    textAlign(CENTER);
    textSize(20);
    text(points, width/2, 75);
    popStyle();
  }
  
  void incrementPoints() {
    points ++;
  }
  
  void finalSay() {
    pushStyle();
    fill(0, 230);
    rect(25, 25, width - 50, height - 50);
    fill(255);
    textAlign(CENTER);
    textSize(20);
    if (planetMars.stillNotThere() == false) {
      text("You made it to Mars! Incredible!", width/2, height/2 - 120);
    }
    text(congratulate() + " Here is your score:", width/2, height/2 - 70);
    textSize(30);
    text(points, width/2, height/2 - 10);
    popStyle();
  }
  
  String congratulate() {
    if (points < 20) {
      text = bad;
    } else if (points < 50) {
      text = good;
    } else {
      text = great;
    }
    return text;
  }
   
}