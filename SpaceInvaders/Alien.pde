public class Alien extends Character {
  boolean isVisible;
  boolean moveRight = true; // alien starts off moving to the right (when it moves left, this is false)
  int xDiameter;
  int yDiameter;
  int score;
  PImage img;
  
  Alien(int x, int y, int s, PImage i) {
    super(x, y, 1); // 1 is the default alien speed
    isVisible = true;
    score = s;
    img = i;
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
      image(this.img, this.xPos-this.xDiameter/2, this.yPos, this.xDiameter, this.yDiameter);
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
