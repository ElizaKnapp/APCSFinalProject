public class GoodBullet extends Bullet {
  GoodBullet(int x, int y, int speed) {
    super(x, y, speed);
  }
  
  void display() {
    fill(#40F00C);
    super.display();
    // if it reaches the top 
    if (this.yPos < 0) {
      this.changeVisibility(); 
    }
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
