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
      // 20 because size = 40 and that is 40 / 2 !!!!
      ellipse(this.xPos, this.yPos, size, size);
    }
  }
  
  void changeVisibility() {
    isVisible = false;
  }
  
}
