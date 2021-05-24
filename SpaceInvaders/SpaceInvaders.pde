// instance variables
Player p;

// setup
void setup() {
  size(800, 600);
  p = new Player(0, 8);
}

// runs multiple times
void draw() {
  // wipe background to black
  background(0);
  p.move();
  p.display();
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
