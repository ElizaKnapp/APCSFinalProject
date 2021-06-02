public class Alien2 extends Alien {
  
  Alien2(int x, int y, PImage i) {
    super(x, y, 20);
    this.img = i;
  }
  
  void display() {
    if (isVisible) {
      image(this.img, this.xPos-12.5, this.yPos, this.xDiameter, this.yDiameter);
    }
  }
}
