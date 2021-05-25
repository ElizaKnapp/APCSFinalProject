// instance variables
Player p;
GoodBullet b;
boolean goodBullet = false;
Alien[][] aliens;
int rowMoving = 4; // this is the 5th row

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
    
  // move the row
  for (int j = 0; j < 11; j++) {
    aliens[rowMoving][j].move();
  }
  delay(100);
  rowMoving --;
  if (rowMoving < 0) rowMoving = 4;
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
