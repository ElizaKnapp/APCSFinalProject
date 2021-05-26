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
      ellipse(this.xPos, this.yPos, 5, 5);
    }
  }
  
  void changeVisibility() {
    isVisible = false;
  }
  
  boolean hitAlien(Alien a) {
    if (a.isVisible) {
      return (
        dist(this.xPos, this.yPos, a.xPos, a.yPos) <= a.xDiameter / 2
      );
    } else {
      return false;
    }
    
  }
  
}
