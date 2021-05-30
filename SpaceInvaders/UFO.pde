public class UFO extends Alien {
  
  
  UFO(int x, int y, int s) {
    super(x, y, s);
    this.xDiameter = 30;
  }
  
  void move() {
    this.xPos += this.speed;
    if (this.xPos > 1000) {
      this.xPos = 0;
    }
  }
  
  void display() {
    fill(#F0180C);
    ellipse(this.xPos, this.yPos, this.xDiameter, this.yDiameter);
  }
  
}
