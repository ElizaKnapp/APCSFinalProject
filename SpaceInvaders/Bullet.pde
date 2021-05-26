public class Bullet extends Character {
  boolean isVisible;
  
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
      rect(this.xPos + 20, this.yPos, 2, 10);
    }
  }
  
  void changeVisibility() {
    isVisible = false;
  }
  
  boolean hitAlien(Alien a) {
    return (dist(this.xPos-1, this.yPos-5, a.xPos, a.yPos) < a.xDiameter) && a.yPos == this.yPos;
  }
  
}
