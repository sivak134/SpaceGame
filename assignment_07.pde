/*
class name: ARTG2206
name: Anna Guidi
email: guidi.a@husky.neu.edu
assignment number: 07
game name: Space Race
*/

Shuttle spaceShuttle;
Mars planetMars;
Bar fuelBar;
Meter fuelMeter;
Score score;
Coin[] coins;
Meteorite[] meteorites;
int coinCount = 30;
int meteoriteCount = 20;
PImage bg;
PImage mineral, specialMineral;
PImage spaceShip;
PImage meteorite;
PImage mars, marsIcon;
PFont font;
int x = 0;
int screen = 1;
boolean hit = false;
float level = 1;

void setup() {
  size(800, 458);
  bg = loadImage("space.png");
  mineral = loadImage("colorMineral.png");
  mineral.resize(20,20);
  specialMineral = loadImage("blueMineral.gif");
  specialMineral.resize(20,20);
  spaceShip = loadImage("smallspsh.png");
  spaceShip.resize(48,48);
  meteorite = loadImage("meteorite.png");
  meteorite.resize(20,20);
  mars = loadImage("mars.gif");
  mars.resize(400,400);
  marsIcon = loadImage("mars.gif");
  marsIcon.resize(20,20);
  
  
  font = createFont("krunch_bold.ttf", 20);
  
  spaceShuttle = new Shuttle(width/2, height/2);
  planetMars = new Mars();
  score = new Score();
  coins = new Coin[coinCount];
  meteorites = new Meteorite[meteoriteCount];
  fuelBar = new Bar();
  fuelMeter = new Meter();

  moreCoins();
  moreMeteorites(level);

}

void draw() {
  background(0);
  
  image(bg, x, 0);
  image(bg, x+bg.width, 0);
  
  planetMars.render();
  spaceShuttle.render();
 
  if (keyPressed) {
    if (key == ' ') {
      screen = 2;
    }
    if (screen == 2 && key == CODED) {
      if (keyCode == UP) {
        spaceShuttle.moveUP();
      } else if (keyCode == DOWN) {
        spaceShuttle.moveDown();
      }
    }
  }
  
  if (screen == 1) {
    //splashScreen
    pushStyle();
    textFont(font);
    fill(0, 230);
    rect(25, 25, width - 50, height - 50);
    fill(255);
    textAlign(CENTER);
    textSize(20);
    text("Welcome to Space Race!", width/2, height/2 - 120);
    text("You are Aalon Mux, the CEO of well known SpaceS", width/2, height/2 - 70);
    text("Collect precious minerals to refuel & avoid meteorites to reach Mars!", width/2, height/2 - 10);
    image(meteorite, width/2 + 80, height/2 + 30);
    image(mineral, width/2, height/2 + 30);
    image(specialMineral, width/2 - 80, height/2 + 30);
    text("Press the space bar to start, good luck!", width/2, height/2 + 130);
    popStyle();
  } else {
    
    //planet and coins in motion
    // if Mars is not in middle of screen
    if (planetMars.stillNotThere() && hit == false && fuelMeter.fuelDepleted() == false) {
      
      fuelMeter.decrease();
      planetMars.move();
      
      x--;
      if (x<-bg.width) {
        x=0;
      }
      
      for (int i = 0; i < coins.length; i++) {
        coins[i].render();
        coins[i].move();
      }
      
      for (int i = 0; i < meteorites.length; i++) {
        meteorites[i].render();
        meteorites[i].move();
      }
      
      if (meteorites[meteorites.length - 1].x < width/6) {
        level += .15;
        moreMeteorites(level);
      }
      
      if (coins[coins.length -1].x < width/7) {
        moreCoins();
      }
      
    //one of 3 ways to end game, either reach mars, got hit or fuel got depleated
    } else if (planetMars.stillNotThere() == false || hit == true || fuelMeter.fuelDepleted() == true) {
        score.finalSay();
    }
    
    fuelBar.render();
    fuelMeter.render();
    checkCoin();
    checkMeteorite();
    score.checkDistance(spaceShuttle,planetMars);
    score.render();
  }
}



void checkCoin() {
  for (int b = coins.length; b-- != 0;) {
    if (coins[b].special) {
      coins[b].checkHit(spaceShuttle, score, fuelMeter, true);
    } else {
      coins[b].checkHit(spaceShuttle, score, fuelMeter, false);
    }
  }
}

void checkMeteorite() {
  for (int b = meteorites.length; b-- != 0;) {
    if (meteorites[b].checkHit(spaceShuttle) == true) {
      hit = true;
    }
  }
}

void moreMeteorites(float level) {
  //level means speed
  println(level);
  for (int i = 0; i < meteorites.length; i++) {
    meteorites[i] = new Meteorite( width + i * (8.0 * width) / meteorites.length, random(0.1 * height, 0.9 * height), level);
  }
}

void moreCoins() {
  for (int i = 0; i < coins.length; i++) {
    if (i%5 == 0) {
      coins[i] = new Coin( width + i * (8.0 * width) / coins.length, random(0.1 * height, 0.9 * height), true);
    } else {
      coins[i] = new Coin( width + i * (8.0 * width) / coins.length, random(0.1 * height, 0.9 * height), false);
    }
  }
}