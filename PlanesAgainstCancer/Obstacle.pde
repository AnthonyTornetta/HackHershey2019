class Obstacle
{
  float x, y;
  float w, h;
  
  public Obstacle(float x, float y, float w, float h)
  {
    this.x = x;
    this.h = h;
    this.y = y;
    this.w = w;
  }
  
  public float getX() { return x; }
  public float getY() { return y; }
  public float getWidth() { return w; }
  public float getHeight() {return h; }
}
