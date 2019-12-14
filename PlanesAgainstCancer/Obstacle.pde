class Obstacle
{
  private float x, y;
  private float w, h;
  
  // Returns where they are colliding or null if not
  public PVector getCollidingPoint(PVector lineStart, PVector lineEnd)
  {
    for(int dx = 0; dx <= 1; dx++)
    {
      for(int dy = 0; dy <= 1; dy++)
      {
        PVector vec = lineIntersection(x, y, x + w * dx, y + h * dy, lineStart.x, lineStart.y, lineEnd.x, lineEnd.y);
        if(vec != null)
          return vec;
      }
    }
    
    return null;
  }
  
  PVector lineIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4)
  {
    // calculate the distance to intersection point
    float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
    float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  
    // if uA and uB are between 0-1, lines are colliding
    if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1)
      return new PVector(x1 + (uA * (x2-x1)), y1 + (uA * (y2-y1)));
    return null;
  }
  
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
