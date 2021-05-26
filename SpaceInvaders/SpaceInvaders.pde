// instance variables
Player p;
GoodBullet b;
boolean goodBullet = false;
Alien[][] aliens;

// setup
void setup() {
  size(600, 600);
  p = new Player(0, 500, 8);
  aliens = new Alien[5][11];
  for (int i = 0; i < 5; i++) {
    for (int j = -5; j < 6; j++) {
      aliens[i][j + 5] = new Alien(width / 2 + j * 40, 50 + i * 40); // CHANGE TO ACTUAL POSITIONS
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
  // move the row
  int m = millis();
  for (int j = 0; j < 11; j++) {
    if (m % 1000 == 200) {
      aliens[0][j].move();
    }
    if (m % 1000 == 400) {
      aliens[1][j].move();
    }
    if (m % 1000 == 600) {
      aliens[2][j].move();
    }
    if (m % 1000 == 800) {
      aliens[3][j].move();
    }
    if (m % 1000 == 0) {
      aliens[4][j].move();
    }
  }
  
  // check if aliens have touched side
  if (aliens[0][10].xPos > 585 || aliens[0][0].xPos < 15) {
    // if they are at an edge, change all alien directions
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 11; j++) {
        aliens[i][j].changeDirection();
      }
    }
  }
  // display all the alines
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 11; j++) {
      aliens[i][j].display();
    }
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
