public class Barrier { 
  Block[] blocks;
  int xPos;
  int yPos;
  int size = 12; // should be the same as the block class
  
  Barrier(int x, int y) {
    // this is the xPosition of the bottom left block
    xPos = x;
    
    // yPos included to make small changes easier
    yPos = y;
    
    // initialize the array with 11 blocks
    blocks = new Block[11];
    // by row
    // the top row
    for (int i = 0; i < 5; i++) {
      blocks[i] = new Block(xPos + size * i, yPos);
    }
    // middle row
    for (int i = 0; i < 5; i++) {
      if (i < 2) {
        blocks[5 + i] = new Block(xPos + size * i, yPos + size);
      }
      if (i > 2) {
        blocks[4 + i] = new Block(xPos + size * i, yPos + size);
      }
    }
    // bottom 2
    blocks[9] = new Block(xPos, yPos + 2 * size);
    blocks[10] = new Block(xPos + 4 * size, yPos + 2 * size);
   
    
  }
  
  void display() {
    for (int i = 0; i < 11; i++) {
      blocks[i].display();
    }
  }
  
  boolean checkHit(Bullet b) {
    boolean ans = false;
    for (int i = 0; i < 11; i++) {
      if (blocks[i].checkHit(b)) {
        ans = true;
      }
    }
    return ans;
  }
}
