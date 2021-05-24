// instance variables
Player p;
Bullet b;

// setup
void setup() {
  size(800, 600);
  p = new Player(0, 8);
  //b = new Bullet(400, 500, -2); //testing
}

// runs multiple times
void draw() {
  // wipe background to black
  background(0);
  displayPlayer();
  //b.move();
  //b.display();
}

void displayPlayer() {
  p.move();
  p.display();
}

void checkBullet() {
  //check if bullet is hitting any entity
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
}
  
void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT || keyCode == LEFT) {
      p.changeDirection(0);
    }
  }
}
