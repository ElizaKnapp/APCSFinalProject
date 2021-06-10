public class BarrierGift extends Gift {
  
  BarrierGift(int x, int y, float s, PImage i) {
    super(x, y, s, i);
    this.xDiameter = 35;
    this.yDiameter = 25;
  }
  
  void move() {
    this.xPos += this.speed;
    if (this.xPos > 6000) { // change the frequency, this is very infrequent
      this.xPos = 0;
    }
    if (this.xPos > 700) {
      this.isVisible = true;
    }
  }
  
}
