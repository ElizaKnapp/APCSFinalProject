// instance variables
Player p;
GoodBullet b;
int numGoodBullets = 0;

// setup
void setup() {
  size(800, 600);
  p = new Player(0, 8);
}

// runs multiple times
void draw() {
  // wipe background to black
  background(0);
  displayPlayer();
  checkBullet();
}

void displayPlayer() {
  p.move();
  p.display();
}

void checkBullet() {
  // check is bullet is shot
  if (numGoodBullets == 1) {
    b.move();
    b.display();
  }
  // check if bullet is hitting any entity
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
    b = new GoodBullet(p.xPos, p.yPos, -2);
    numGoodBullets += 1;
  } 
}
  
void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT || keyCode == LEFT) {
      p.changeDirection(0);
    }
  }
}
