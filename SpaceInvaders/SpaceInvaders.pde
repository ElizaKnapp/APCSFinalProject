// instance variables
Player p;
GoodBullet b;
BadBullet bad;
boolean goodBullet = false; //if player's bullet is present
boolean badBullet = false; //if alien bullet is present
Alien[][] aliens;
boolean start; //start screen
int alive = 55; //number of aliens not shot
int lives = 3; //number of lives the player has
Barrier[] barriers;

// setup
void setup() {
  size(600, 600);
  p = new Player(280, 500, 8); //280 is the center
  aliens = new Alien[5][11];
  for (int i = 0; i < 5; i++) {
    for (int j = -5; j < 6; j++) {
      aliens[i][j + 5] = new Alien(width / 2 + j * 40, 50 + i * 40); // CHANGE TO ACTUAL POSITIONS
    }
  }
  
  // create the array of barriers
  // total screen space = 600 so say the barriers are at 75, 225, 375, 525
  barriers = new Barrier[4];
  int startXPos = 50;
  for (int i = 0; i < 4; i++) {
    // TO CHANGE LOCATION- the first parameter is the xPos of the top left of the barrier, the second is the yPos
    barriers[i] = new Barrier(startXPos + 150 * i, 440);
  }
}

// runs multiple times
void draw() {
  // wipe background to black
  background(0);
  if (!start) { //start screen
    fill(255);
    if (mouseX >= 50 && mouseX <= 550 && mouseY >= 250 && mouseY <= 300) {
      fill(#40F00C);
    }
    textSize(50); 
    text("CLICK HERE TO PLAY", 50, 300);
  } else if (alive == 0) { //player shot all the aliens
    textSize(100); 
    fill(255);
    text("YOU WIN!", 75, 250);
    if (mouseX >= 100 && mouseX <= 500 && mouseY >= 295 && mouseY <= 325) {
      fill(#40F00C);
    }
    textSize(30);
    text("CLICK HERE TO PLAY AGAIN", 100, 325);
  } else if (lives == 0) { //aliens killed player
    fill(255);
    textSize(75); 
    text("GAME OVER!", 75, 250);
    // play again button
    if (mouseX >= 100 && mouseX <= 500 && mouseY >= 295 && mouseY <= 325) {
      fill(#40F00C);
    }
    textSize(30);
    text("CLICK HERE TO PLAY AGAIN", 100, 325);
  } else {
    displayPlayer();
    checkBullet();
    displayAlien();
    displayLives();
    displayBarrier();
  }
}

void displayPlayer() {
  p.move();
  p.display();
}

void checkBullet() {
  // check if bullet is shot
  if (goodBullet) {
    b.move();
    b.display();
    // check if bullet is hitting an alien
    for (int r = 0; r < 5; r++) {
      for (int c = 0; c < 11; c++) {
        if (b.hitAlien(aliens[r][c])) {
          b.changeVisibility();
          aliens[r][c].changeVisibility(); //alien dies
          alive--; //less aliens visible
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
      bad.changeVisibility(); //bullet disappears
      lives--; //player loses a life
    }
    if (!bad.isVisible) {
      badBullet = false; //bad bullet does not exist on screen 
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
  // display all the aliens
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 11; j++) {
      aliens[i][j].display();
    }
  }
  
  // aliens shoot bullets
  if (!badBullet) { //if no other alien bullets are on screen
    int r = (int) (Math.random() * 5);
    int c = (int) (Math.random() * 11);
    while (!aliens[r][c].isVisible) { //so bullets only come from existing aliens
      r = (int) (Math.random() * 5);
      c = (int) (Math.random() * 11);
    }
    bad = new BadBullet(aliens[r][c].xPos, aliens[r][c].yPos, 5);
    badBullet = true; //bad bullet exists on screen
  }  
}

void displayBarrier() {
  for (int i = 0; i < 4; i++) {
    barriers[i].display();
    if (goodBullet) {
      barriers[i].checkHit(b); // checks if it was hit by a good bullet
    }
    if (badBullet) {
      barriers[i].checkHit(bad); // checks if it was hit by a bad bullet
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      p.changeDirection(1); //move right
    }
    if (keyCode == LEFT) {
      p.changeDirection(-1); //move left
    }
  }
  if (keyCode == ' ') { //SPACE to shoot a bullet
    if (!goodBullet){
      b = new GoodBullet(p.xPos + p.size / 2, p.yPos, -8);
      goodBullet = true;
    }
  } 
}

void displayLives() {
  textSize(25); 
  text("LIVES: " + lives, 15, 575);
}
  
void keyReleased() { //when not pressing keys, the player doesn't move
  if (key == CODED) {
    if (keyCode == RIGHT || keyCode == LEFT) {
      p.changeDirection(0);
    }
  }
}

void mousePressed() { // when the player wants to start the game
  if (mouseX >= 50 && mouseX <= 550 && mouseY >= 250 && mouseY <= 300 && start == false) {
    start = true;
  }
  // on the end screen
  if (mouseX >= 100 && mouseX <= 500 && mouseY >= 295 && mouseY <= 325 && (lives == 0 || alive == 0)) {
    lives = 3;
    alive = 55;
    goodBullet = false; //if player's bullet is present
    badBullet = false; //if alien bullet is present
    // set everything up again to play
    setup();
  }
 
}
