public abstract class Character {
  int xPos, yPos;
  float speed;
  
  Character(int x, int y, float s){
    xPos = x;
    yPos = y;
    speed = s;
  }
  
  abstract void move();
  
  abstract void display();
}
