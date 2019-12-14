class Obstacle{
  PVector location = new PVector();
  int w, h; 
  
  Obstacle(int x, int y, int w, int h){
    location.x = x;
    location.y = y;
    this.w = w;
    this.h = h;    
  }
  
  void show(){
    fill(255);
    stroke(255);
    rect(location.x, location.y, w, h);    
  }  
}
