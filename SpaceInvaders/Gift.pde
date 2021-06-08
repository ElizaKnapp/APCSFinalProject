public class Gift extends Alien {  
  
  Gift(int x, int y, float s, PImage i) { // s parameter is speed
    super(x, y, 0, i, i); // score is 0 because gifts don't add to score
    this.xDiameter = 25;
    this.yDiameter = 25;
    this.speed = s;
  }
  
  void move() {
    this.xPos += this.speed;
    if (this.xPos > 2000) { // change the frequency
      this.xPos = 0;
    }
    if (this.xPos > 700) {
      this.isVisible = true;
    }
  }
  
}
