public class BadBullet extends Bullet {
  BadBullet(int x, int y, int speed) {
    super(x, y, speed);
  }
  
  void display() {
    fill(255);
    super.display();
    // if it reaches the top 
    if (this.yPos > 600) {
      this.changeVisibility(); 
    }
  }
  
  boolean hitPlayer(Player p) {
    return (dist(this.xPos, this.yPos + p.size/2, p.xPos + p.size/2, p.yPos) <= p.size/2);
  }
  
}
