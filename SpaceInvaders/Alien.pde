public class Alien extends Character {
  boolean isVisible;
  boolean moveRight = true; // alien starts off moving to the right (when it moves left, this is false)
  
  Alien(int x, int y) {
    super(x, y, 5); // 10 is the default alien speed
  }
  
  void move() {
    if (moveRight) {
      this.xPos += this.speed;
    } else {
      this.xPos -= this.speed;
    }
    if (this.xPos > 585 || this.xPos < 15) {
      moveRight = !moveRight;
      this.yPos += 5;
    }
  }
  
  void display() {
    fill(255);
    ellipse(this.xPos, this.yPos, 30, 25);
  }
  
  
}
