public class Alien extends Character {
  boolean isVisible;
  boolean moveRight = true; // alien starts off moving to the right (when it moves left, this is false)
  
  Alien(int x, int y) {
    super(x, y, 10); // 10 is the default alien speed
  }
  
  void move() {
    this.xPos += this.speed;
  }
  
  void display() {
  }
  
  
}
