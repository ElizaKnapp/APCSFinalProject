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
int score = 0;
int rounds = 1;
UFO ufo;

// setup
void setup() {
  size(600, 600);
  p = new Player(280, 500, 8); //280 is the center
  aliens = new Alien[5][11];
  for (int i = 0; i < 5; i++) {
    for (int j = -5; j < 6; j++) {
      if (i == 0) {
        aliens[i][j + 5] = new Alien3(width / 2 + j * 40, 75 + i * 40); // CHANGE TO ACTUAL POSITIONS
      } else if (i < 3) {
        aliens[i][j + 5] = new Alien2(width / 2 + j * 40, 75 + i * 40); // CHANGE TO ACTUAL POSITIONS
      } else {
        aliens[i][j + 5] = new Alien1(width / 2 + j * 40, 75 + i * 40); // CHANGE TO ACTUAL POSITIONS
      }
    }
  }
  
  // start UFO
  ufo = new UFO(-5000, 40, 4); // starting x coordinate is very negative so it doesn't start on screen
  
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
    //textSize(50); 
    //fill(255);
    //text("ROUND 2", 250, 300);
    delay(1000);
    lives = 3;
    alive = 55;
    goodBullet = false; //if player's bullet is present
    badBullet = false; //if alien bullet is present
    rounds += 1;
    // set everything up again to play
    setup();
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
    displayScore();
    displayUFO();
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
          score += aliens[r][c].score;
        }
      }
    }
    
    // check if the ufo is hit
    if (b.hitAlien(ufo)) {
      b.changeVisibility();
      ufo.changeVisibility();
      score += ufo.score;
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
      if (barriers[i].checkHit(b)) {
        // if it is hit change the visibility
        b.changeVisibility();
        b.display();
        // there is no good bullet now
        goodBullet = false; 
      }
      // checks if it was hit by a good bullet
    }
    if (badBullet) {
      if (barriers[i].checkHit(bad)) {
        bad.changeVisibility();
        bad.display();
        badBullet = false;
      }// checks if it was hit by a bad bullet
    }
  }
}

void displayScore() {
  fill(255);
  textSize(25);
  text("SCORE <" + rounds + "> : " + score, 0, 25);
}

void displayUFO() {
  ufo.move();
  ufo.display();
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
  // on the end screen (when you lose)
  if (mouseX >= 100 && mouseX <= 500 && mouseY >= 295 && mouseY <= 325 && (lives == 0)) {
    lives = 3;
    alive = 55;
    goodBullet = false; //if player's bullet is present
    badBullet = false; //if alien bullet is present
    score = 0;
    rounds = 1;
    // set everything up again to play
    setup();
  }
 
}
