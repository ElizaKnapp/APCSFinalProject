public class Gift extends Alien {  
  
  Gift(int x, int y, int s, PImage i) { // s parameter is speed
    super(x, y, 0, i); // last parameter is score, it = 0 because gifts don't add score
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
