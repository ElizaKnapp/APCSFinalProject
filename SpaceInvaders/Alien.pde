public class Alien extends Character {
  boolean isVisible;
  boolean moveRight = true; // alien starts off moving to the right (when it moves left, this is false)
  int xDiameter = 25;
  int yDiameter = 25;
  int score;
  PImage img;
  
  Alien(int x, int y, int s) {
    super(x, y, 1); // 10 is the default alien speed
    isVisible = true;
    score = s;
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
    this.yPos += 4; 
  }
  
  void display() {
    if (isVisible) {
      fill(255);
      ellipse(this.xPos, this.yPos, xDiameter, yDiameter);
    }
  }
  
  void changePos() {
    move();
    display();
  }
  
  void changeVisibility() {
    isVisible = false;
  }
 
}
