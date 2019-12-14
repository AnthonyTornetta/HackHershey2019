class Obstacle
{
  PVector location = new PVector();
  float w, h;
  
  public Obstacle(float x, float y, float w, float h)
  {
    location.x = x;
    location.y = y;
    this.h = h;
    this.w = w;
  }
  
  void show(){
    fill(255);
    stroke(255);
    rect(location.x, location.y, w, h);    
  }  
  
  public float getX() { return location.x; }
  public float getY() { return location.y; }
  public float getWidth() { return w; }
  public float getHeight() {return h; }
}
