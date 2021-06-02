public class Block {
  int lives = 4;
  boolean isVisible = true;
  int xPos;
  int yPos;
  int size = 14; // should be the same as the barrier class (MUST BE EVEN FOR PIXELATION)
  int[][][] configs; // each configuration, 1 is green, 0 is black
  
  Block(int x, int y) {
    xPos = x;
    yPos = y;
    configs = new int[5][size][size]; // 5 sets of size^2 (4, 3, 2, 1, 0) lives
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < size; j++) {
        for (int k = 0; k < size; k++) {
          if (i == 4) {
            configs[4][j][k] = 1; // because this means it has 4 lives
          }
          else if (i > 0) { // if i is 1, 2 or 3
            if ((int)(Math.random() * 4) >= i) { //Math.random gives 0-3 so 1/4 of the squares are black
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
      // depending on the amount of lives, adjust the number that are colored
     
      for (int i = 0; i < size; i += 2) {
        for (int j = 0; j < size; j += 2) {
          if (configs[lives][i][j] == 1) {
            fill(#40F00C); // if it is 1, then fill green
          } else {
            fill(0);
          }
          rect(xPos + i, yPos + j, 2, 2);
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
