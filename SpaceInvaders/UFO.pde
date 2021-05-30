public class UFO extends Alien {  
  
  UFO(int x, int y, int s) { // s parameter is speed
    super(x, y, 50); // last parameter is score
    this.xDiameter = 30;
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
  
  void display() {
    if (this.isVisible) {
       fill(#F0180C);
       ellipse(this.xPos, this.yPos, this.xDiameter, this.yDiameter);
    }
   
  }
  
}
