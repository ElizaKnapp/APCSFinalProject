public class BadBullet extends Bullet {
  BadBullet(int x, int y, int speed) {
    super(x, y, speed);
  }
  
  void display() {
    super.display();
    // if it reaches the top 
    if (this.yPos > 600) {
      this.changeVisibility(); 
    }
  }
  
}
