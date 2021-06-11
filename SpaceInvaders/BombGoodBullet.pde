public class BombGoodBullet extends GoodBullet {
  
  BombGoodBullet(int x, int y, int speed) {
    super(x, y, speed);
    this.c = #FA7108;
    this.size = 12;
  }
  
  boolean hitAlien(Alien a) {
    if (a.isVisible) {
      return (
        dist(this.xPos, this.yPos, a.xPos, a.yPos) <= (a.xDiameter / 2 + this.size / 2)
      );
    } else {
      return false;
    }
  }
  
  
  
}
