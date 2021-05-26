public class GoodBullet extends Bullet {
  GoodBullet(int x, int y, int speed) {
    super(x, y, speed);
  }
  
  void display() {
    super.display();
    // if it reaches the top 
    if (this.yPos < 0) {
      this.changeVisibility(); 
    }
  }
}
