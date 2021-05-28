public class Block {
  int lives = 4;
  boolean isVisible = true;
  int xPos;
  int yPos;
  int size = 10;
  
  Block(int x, int y) {
    xPos = x;
    yPos = y;
  }
  
  void display() {
    if (isVisible) {
      noStroke();
      fill(#40F00C);
      // depending on the amount of lives, adjust the number that are colored
      /*
      for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
          if (Math.random() * 4 + 1 > lives) {
            // for every time it is  equal, set an extra square to black (this might be a bug though because the black ones keep changing)
            // this bug can be fixed by setting the overall color first and putting this function in checkHit
            fill(0);
            rect(xPos, yPos, 1, 1);
          }
        }
      }
      
      */
      rect(xPos, yPos, size, size);
     }
  }
   
  // takes in a bullet, checks if it hits it, and adjusts accordingly
  void checkHit(Bullet b) {
    if (abs(b.xPos - this.xPos) <= size && abs(b.yPos - this.yPos) <= size) {
      // decrease lives
      lives -= 1;   
      if (lives == 0) {
        isVisible = false;
      }
    }
  }
  
}
