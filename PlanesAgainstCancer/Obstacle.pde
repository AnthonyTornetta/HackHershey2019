class Obstacle extends DrawnObject
{
  private float w, h;
  
  public Obstacle(float x, float y, float w, float h)
  {
    position = new PVector(x, y);
    this.w = w;
    this.h = h;
  }
}
