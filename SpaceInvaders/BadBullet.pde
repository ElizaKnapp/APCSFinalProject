public class BadBullet extends Bullet {
  BadBullet(int x, int y, int speed) {
    super(x, y, speed);
  }
  
  void display() {
    fill(255);
    super.display();
    // if it reaches the top 
    if (this.yPos > 530) { // 530 because that's where the line is at the bottom
      this.changeVisibility(); 
    }
  }
  
  boolean hitPlayer(Player p) {
    return( 
      (abs(this.xPos - (p.xPos + p.size/2)) < p.size/2) &&
      (abs(this.yPos - (p.yPos + p.size/2)) < p.size/2)
    );
  }
  
}
