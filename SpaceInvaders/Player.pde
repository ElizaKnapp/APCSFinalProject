public class Player extends Character {
  int direction = 0;
  int size = 40;
  
  Player(int x, int s) {
    super(x, 500, s);
  }
  
  void move() {
    if (this.xPos < 0) this.xPos = 0;
    if (this.xPos < 760) this.xPos = 760;
    if (direction == -1) {
      this.xPos -= this.speed;
    }
    if (direction == 1) {
      this.xPos += this.speed;
    }
  }
  
  void display() {
    fill(255);
    rect(this.xPos, this.yPos, size, size);
  }
  
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        direction = 1;
      }
      if (keyCode == LEFT) {
        direction = -1;
      }
    }
  }
  
  void keyReleased() {
    if (key == CODED) {
      if (keyCode == RIGHT || keyCode == LEFT) {
        direction = 0;
      }
    }
  }
  
}
