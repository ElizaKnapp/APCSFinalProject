// instance variables
Player p;
GoodBullet b;
boolean goodBullet = false;
Alien[][] aliens;

// setup
void setup() {
  size(800, 600);
  p = new Player(0, 500, 8);
  aliens = new Alien[5][11];
  for (int i = 0; i < 5; i++) {
    for (int j = -5; j < 6; j++) {
      int initialRowYPos = 100;
      int middleColumnXPos = width / 2;
      aliens[i][j + 5] = new Alien(width / 2 + j * 40, 100 + i * 50); // CHANGE TO ACTUAL POSITIONS
    }
  }
}

// runs multiple times
void draw() {
  // wipe background to black
  background(0);
  displayPlayer();
  checkBullet();
  displayAlien();
}

void displayPlayer() {
  p.move();
  p.display();
}

void checkBullet() {
  // check is bullet is shot
  if (goodBullet) {
    b.move();
    b.display();
    if (!b.isVisible) {
      goodBullet = false;
    }
  }
  // check if bullet is hitting any entity
}

void displayAlien() {
  // loop through each row of the array (aliens) and move them all one at a time
  for (int i = 0; i < 5; i++) {
    
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      p.changeDirection(1);
    }
    if (keyCode == LEFT) {
      p.changeDirection(-1); 
    }
  }
  if (keyCode == ' ') { // SPACE
    if (!goodBullet){
      b = new GoodBullet(p.xPos, p.yPos, -8);
      goodBullet = true;
    }
  } 
}
  
void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT || keyCode == LEFT) {
      p.changeDirection(0);
    }
  }
}
