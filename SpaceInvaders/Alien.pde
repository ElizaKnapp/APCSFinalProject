public class Alien extends Character {
  boolean isVisible;
  boolean moveRight = true; // alien starts off moving to the right (when it moves left, this is false)
  
  Alien(int x, int y) {
    super(x, y, 1); // 10 is the default alien speed
  }
  
  void setYPos(int newPos) {
    this.yPos = newPos;
  }
  
  void move() {
    if (moveRight) {
      this.xPos += this.speed;
    } else {
      this.xPos -= this.speed;
    }
  }
  
  void changeDirection() {
    moveRight = !moveRight;
    this.yPos += 2; 
  }
  
  void display() {
    fill(255);
    ellipse(this.xPos, this.yPos, 30, 25);
  }
  
  void changePos() {
    move();
    display();
  }
 
  
  
}
