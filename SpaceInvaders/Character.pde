public abstract class Character {
  int xPos, yPos, speed;
  
  Character() {
  }
  
  Character(int x, int y, int s){
    xPos = x;
    yPos = y;
    speed = s;
  }
  
  abstract void move();
  
  abstract void display();
}
