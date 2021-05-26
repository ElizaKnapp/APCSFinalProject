// instance variables
Player p;
GoodBullet b;
BadBullet bad;
boolean goodBullet = false;
boolean badBullet = false;
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
    // check if bullet is hitting an alien
    for (int r = 0; r < 5; r++) {
      for (int c = 0; c < 11; c++) {
        if (b.hitAlien(aliens[r][c])) {
          b.changeVisibility();
          aliens[r][c].changeVisibility();
        }
      }
    }
    if (!b.isVisible) {
      goodBullet = false;
    }
  }
  
  if (badBullet) { //when an alien shoots
    bad.move();
    bad.display();
    if (bad.hitPlayer(p)) { // when the alien hits the player
      bad.changeVisibility();
    }
    if (!bad.isVisible) {
      badBullet = false;
    }
  }
}

void displayAlien() {
  // move the rows
  for (int r = 0; r < 5; r++) {
    for (int c = 0; c < 11; c++) {
      aliens[r][c].move();
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
  
  // aliens shoot bullets
  if (!badBullet) {
    int r = (int) Math.random() * 5;
    int c = (int) Math.random() * 11;
    bad = new BadBullet(aliens[r][c].xPos, aliens[r][c].yPos, 5);
    badBullet = true;
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
