class Obstacle extends DrawnObject
{
  float w, h;
  
  public Obstacle(float x, float y, float w, float h)
  {
    position = new PVector(x, y);
    this.w = w;
    this.h = h;
  }
  
  public float getX() { return x; }
  public float getY() { return y; }
  public float getWidth() { return w; }
  public float getHeight() {return h; }
}
