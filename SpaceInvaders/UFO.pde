public class UFO extends Alien {  
  
  UFO(int x, int y, int s, PImage i) { // s parameter is speed
    // change to red here!
    super(x, y, 50, i); // last parameter is score
    this.xDiameter = 35;
    this.speed = s;
  }
  
  void move() {
    this.xPos += this.speed;
    if (this.xPos > 5000) { // change the frequency
      this.xPos = 0;
    }
    if (this.xPos > 700) {
      this.isVisible = true;
    }
  }
  
}
