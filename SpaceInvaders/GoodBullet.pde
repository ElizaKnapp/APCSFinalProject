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
}
