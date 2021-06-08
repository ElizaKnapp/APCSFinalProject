public class Player extends Character {
  int direction = 0;
  int size = 40;
  PImage img, dead;
  
  Player(int x, int y, int s, PImage i, PImage d) {
    // sets initial y position to 500
    super(x, y, s);
    img = i;
    dead = d;
  }
  
  void move() {
    if (this.xPos < 0) this.xPos = 0;
    if (this.xPos > 560) this.xPos = 560;
    if (direction == -1) {
      this.xPos -= this.speed;
    }
    if (direction == 1) {
      this.xPos += this.speed;
    }
  }
  
  void display() {
    image(img, this.xPos, this.yPos, size, size/2);
  }
  
  void changeDirection(int newDirection) {
    this.direction = newDirection;
  }
  
  void displayDead() {
    image(dead, this.xPos, this.yPos, size, size/2);
  }
  
}
