// instance variables
PImage a1, aa1, a2, aa2, a3, aa3, u, startScreen, startScreenOn, player, gift, deadPlayer, barrierGift;
Player p;
Alien[][] aliens;
GoodBullet b;
BadBullet bad;
boolean goodBullet = false; //if player's bullet is present
boolean badBullet = false; //if alien bullet is present
UFO ufo;
Gift g; // this is the gift box
BarrierGift bgift;
int alive = 55; //number of aliens not shot
int lives = 3; //number of lives the player has
Barrier[] barriers;
boolean start; //start screen
int score = 0;
int rounds = 1;
int left = 0; //leftmost alien
int right = 10; //rightmost alien

//special bullets
int speedBulletCount; //5 speed bullets
boolean bombBullet = false; //one bomb bullet

int deathFrames = 1; //delay after death

void setup() {
  size(600, 600);
  loadImages();
  p = new Player(280, 500, 6, player, deadPlayer); //280 is the center
  aliens = new Alien[5][11];
  for (int i = 0; i < 5; i++) {
    for (int j = -5; j < 6; j++) {
      if (i == 0) { //top row of aliens worth 30 points
        aliens[i][j + 5] = new Alien3(width / 2 + j * 42, 75 + i * 35, a3, aa3);
      } else if (i < 3) { //middle aliens
        aliens[i][j + 5] = new Alien2(width / 2 + j * 42, 75 + i * 35, a2, aa2);
      } else { //botton aliens
        aliens[i][j + 5] = new Alien1(width / 2 + j * 42, 75 + i * 35, a1, aa1);
      }
    }
  } 
  ufo = new UFO(-5000, 40, 2, u); //starting x coordinate is very negative so it doesn't start on screen
  g = new Gift(-500, 40, 2, gift); //gifts
  bgift = new BarrierGift(0, 40, 2, barrierGift);

  //total screen space = 600 so say the barriers are at 75, 225, 375, 525
  barriers = new Barrier[4]; //array of barriers
  int startXPos = 40;
  for (int i = 0; i < 4; i++) {
    // TO CHANGE LOCATION - the first parameter is the xPos of the top left of the barrier, the second is the yPos
    barriers[i] = new Barrier(startXPos + 150 * i, 440);
  }
}

void draw() {
  background(0); //wipe background to black
  if (!start) { //start screen
    image(startScreen, 50, 100, 500, 400);
    
    if (mouseX >= 50 && mouseX <= 530 && mouseY >= 150 && mouseY <= 175) {
      image(startScreenOn, 50, 100, 500, 400);
    }
  } else if (alive == 0) { //player shot all the aliens  
    reset();
    rounds += 1;
    setup(); //set everything up again to play
  } else if (lives == 0 || aliensReach()) { //aliens killed player
    if (deathFrames == 1) {
      delay(2000);
      deathFrames = 0;
    }
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
    displayGift();
    displayBarrierGift();
  }
}

//load all of the images
void loadImages() {
  a1 = loadImage("alien1.jpeg");
  aa1 = loadImage("animate1.jpeg");
  a2 = loadImage("alien2.jpeg");
  aa2 = loadImage("animate2.jpeg");
  a3 = loadImage("alien3.jpeg");
  aa3 = loadImage("animate3.jpeg");
  u = loadImage("ufo.jpeg");
  startScreen = loadImage("Start.jpeg");
  startScreenOn = loadImage("StartHighlighted.jpeg");
  player = loadImage("Player.jpeg");
  deadPlayer = loadImage("DeadPlayer.jpeg");
  gift = loadImage("Gift.jpeg");
  barrierGift = loadImage("BarrierGift.jpeg");
  
}

void displayPlayer() {
  p.move();
  p.display();
}

void checkBullet() {
  if (goodBullet) { //if bullet is shot
    b.move();
    b.display();
    for (int r = 0; r < 5; r++) {
      for (int c = 0; c < 11; c++) {
        if (b.hitAlien(aliens[r][c])) { //if bullet is hitting an alien
          b.changeVisibility();
          aliens[r][c].changeVisibility(); //alien dies
          if (bombBullet) { //aliens surrounding hit alien dies
            int[][] moves = {{0,1}, {0,-1}, {1,0}, {-1,0}}; //directions
            for (int m = 0; m < moves.length; m++) { //kill aliens adjacent to the hit alien
              int i = r + moves[m][0];
              int j = c + moves[m][1];
              if (i >= 0 && j >= 0 && i < aliens.length && j < aliens[0].length) {
                if (aliens[i][j].isVisible) { //kills the aliens that are still alive
                  alive--;
                  score += aliens[i][j].score;
                  aliens[i][j].changeVisibility();
                }
              }
            }
            bombBullet = false;
          }
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
      if (bombBullet) bombBullet = false;
    }
    // check if the gift is hit
    if (b.hitAlien(g)) {
      b.changeVisibility();
      g.changeVisibility();
      // HERE DO WHATEVER HITTING THE GIFT BOX DOES
      if ((int)(Math.random() * 2) == 0) {
        speedBulletCount = 5;
        bombBullet = false; //so that speedBullet doesn't have bombBullet properties if gift is hit by bombBullet
        //print("speed");
      } else {
        bombBullet = true;
        speedBulletCount = 0;
        //print("bomb");
      }
    }
    
    //check if bullets hit each other
    if(b.hitBullet(bad)) {
      b.changeVisibility();
      bad.changeVisibility();
      if (bombBullet) bombBullet = false;
    }
    
    if (!b.isVisible) { //if bullet hits something, no bullet is on screen
      goodBullet = false;
    }
  }
  
  if (badBullet) { //when an alien shoots
    bad.move();
    bad.display();
    if (bad.hitPlayer(p)) { //when the bullet hits the player
      bad.changeVisibility(); //bullet disappears
      if (lives == 1) {
        p.displayDead();
      }
      lives--; //player loses a life
      // Here show the effect of being hit
      
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
  //find the leftmost alien
  for (int c = left; c < aliens[0].length; c++) {
    for (int r = 0; r < aliens.length; r++) {
      if (aliens[r][c].isVisible) {
        left = c;
        r = aliens.length;
        c = aliens[0].length;
      }
    }
  }
  //find the rightmost alien
  for (int c = 0; c < aliens[0].length; c++) {
    for (int r = 0; r < aliens.length; r++) {
      if (aliens[r][c].isVisible) {
        right = c;
      }
    }
  }
  // check if aliens have touched side
  if (aliens[0][right].xPos > 585 || aliens[0][left].xPos < 15) {
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
    if (goodBullet) { //check if hit by good bullet
      if (barriers[i].checkHit(b)) {
        b.changeVisibility();
        b.display();
        goodBullet = false; //there is no good bullet after hitting barrier
        if (bombBullet) bombBullet = false;
      }
    }
    if (badBullet) { //check if hit by bad bullet
      if (barriers[i].checkHit(bad)) {
        bad.changeVisibility();
        bad.display();
        badBullet = false;
      }
    }
  }
}

void displayScore() {
  fill(255);
  textSize(25);
  text("SCORE <" + rounds + "> : " + score, 0, 25);
}

void displayLives() {
  textSize(25); 
  text("LIVES: " + lives, 15, 575);
  // draw lives - 1 player-like shapes
  
  fill(#40F00C);
  for (int i = 0; i < lives - 1; i++) {
    image(player, 130 + i * 60, 555, p.size, p.size / 2);
  }
  
  // separating line
  fill(255);
  rect(0, 535, 600, 2);
}

void displayUFO() {
  ufo.move();
  ufo.display();
}

void displayGift() {
  g.move();
  g.display();
}

void displayBarrierGift() {
  bgift.move();
  bgift.display();
}

boolean aliensReach() { //check if aliens get in the vicinity of the player
  for (int r = 0; r < aliens.length; r++) {
    for (int c = 0; c < aliens[0].length; c++) {
      if (aliens[r][c].isVisible) {
        if (aliens[r][c].yPos >= 480) { //if aliens reach player
          return true;
        }
      }
    }
  }
  return false;
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
  if (start && keyCode == ' ') { //SPACE to shoot a bullet when game is playing
    if (!goodBullet){
      if (speedBulletCount > 0) {
        b = new FastGoodBullet(p.xPos + p.size / 2, p.yPos, -12); // makes the speed faster, also fast good bullets are purple
        speedBulletCount -= 1;
      } else if (bombBullet) { //turns to false if it hits anything in checkBullet()
        b = new BombGoodBullet(p.xPos + p.size / 2, p.yPos, -8);
      } else {
        b = new GoodBullet(p.xPos + p.size / 2, p.yPos, -8);
      }
      goodBullet = true;
    }
  } 
}
  
void keyReleased() { //when not pressing keys, the player doesn't move
  if (key == CODED) {
    if (keyCode == RIGHT || keyCode == LEFT) {
      p.changeDirection(0);
    }
  }
}

void mousePressed() { // when the player wants to start the game
  if ((start == false) && (mouseX >= 50 && mouseX <= 550 && mouseY >= 150 && mouseY <= 175)) {
    start = true;
  }
  // on the end screen (when you lose)
  if ((lives == 0 || aliensReach()) && mouseX >= 100 && mouseX <= 530 && mouseY >= 295 && mouseY <= 325) {
    reset();
    score = 0;
    rounds = 1;
    // set everything up again to play
    setup();
  }
}

//reset all instance variables
void reset() {
  lives = 3;
  alive = 55;
  goodBullet = false;
  badBullet = false;
  left = 0;
  right = 10;
  speedBulletCount = 0;
  bombBullet = false;
  deathFrames = 1;
}
