public class Bullet extends Character {
  boolean isVisible;
  int size = 8;
  
  Bullet(int x, int y, int speed) {
    super(x, y, speed);
    isVisible = true;
  }
  
  void move() {
    //GoodBullet will move up because it has a neg speed
    this.yPos += speed;
  }
  
  void display() {
    if (this.isVisible) {
      ellipse(this.xPos, this.yPos, size, size);
    }
  }
  
  void changeVisibility() {
    isVisible = false;
  }
  
  void hitBullet(Bullet b) {
    if (b.isVisible && this.isVisible) {
      if (dist(this.xPos, this.yPos, b.xPos, b.yPos) <= size) { //size is the sum of the bullets' radius
        b.changeVisibility();
        isVisible = false;
      }
    }
  }
  
}
