public class Bullet extends Character {
  boolean isVisible;
  
  Bullet(int x, int y, int speed) {
    super(x, y, speed);
    isVisible = true;
  }
  
  void move() {
    //GoodBullet will move up because it has a neg speed
    yPos += speed;
  }
  
  void display() {
    rectMode(CENTER);
    rect(this.xPos, this.yPos, 2, 10);
  }
  
}
