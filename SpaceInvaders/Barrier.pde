public class Barrier { 
  Block[] blocks;
  int xPos;
  
  Barrier(int x) {
    // this is the xPosition of the bottom left block
    xPos = x;
    
    // initialize the array with 11 blocks
    blocks = new Block[11];
    // by row
    // the top row
    for (int i = 0; i < 5; i++) {
      blocks[i] = new Block(xPos + 10 * i, 450);
    }
    // middle row
    for (int i = 0; i < 5; i++) {
      if (i < 2) {
        blocks[5 + i] = new Block(xPos + 10 * i, 460);
      }
      if (i > 2) {
        blocks[4 + i] = new Block(xPos + 10 * i, 460);
      }
    }
    // bottom 2
    blocks[9] = new Block(xPos, 470);
    blocks[10] = new Block(xPos + 40, 470);
   
    
  }
  
  void display() {
    for (int i = 0; i < 11; i++) {
      blocks[i].display();
    }
  }
}
