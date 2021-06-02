public class Block {
  int lives = 4;
  boolean isVisible = true;
  int xPos;
  int yPos;
  int size = 14; // should be the same as the barrier class
  int[][][] configs; // each configuration, 1 is green, 0 is black
  
  Block(int x, int y) {
    xPos = x;
    yPos = y;
    configs = new int[4][size][size]; // 4 sets of size^2
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < size; j++) {
        for (int k = 0; k < size; k++) {
          if (i == 4) {
            configs[i][j][k] = 1; // because this means it has 4 lives
          }
          else if (i > 0) { // if i is 1, 2 or 3
            if ((int)Math.random() * 4 >= i) { //Math.random gives 0-3 so 1/4 of the squares are black
              configs[i][j][k] = 0;
            } else {
              configs[i][j][k] = 1;
            }
          }
          else {
            // don't really need this bc it kills visibility anyway
            configs[i][j][k] = 0;
          }
        }
      }
    }
  }
  
  void display() {
    if (isVisible) {
      noStroke();
      // fill(#40F00C);
      // depending on the amount of lives, adjust the number that are colored
     
      for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
          if (Math.random() * 4 + 1 > lives) {
            // for every time it is  equal, set an extra square to black (this might be a bug though because the black ones keep changing)
            // this bug can be fixed by setting the overall color first and putting this function in checkHit
            fill(0);
            rect(xPos + i, yPos + j, 1, 1);
          } else {
            fill(#40F00C);
            rect(xPos + i, yPos + j, 1, 1);
          }
        }
      }
      
     
      // rect(xPos, yPos, size, size);
     }
  }
   
  // takes in a bullet, checks if it hits it, and adjusts accordingly
  boolean checkHit(Bullet b) {
    if (isVisible) {
      if (abs(b.xPos - (this.xPos + size/2)) <= size && abs(b.yPos - (this.yPos + size/2)) <= size) {
        // decrease lives
        lives -= 1;   
        if (lives == 0) {
          isVisible = false;
        }
        return true;
      }
    }
    return false;
  }
  
}
