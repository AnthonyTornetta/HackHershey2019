class Goal{
  PVector location;
  int size;
  
  Goal(int x, int y, int s){
    location = new PVector(x, y);
    size = s;
  }
  
  void show(){
    fill(50, 255, 50);
    noStroke();
    ellipse(location.x, location.y, size, size);
  }
}
