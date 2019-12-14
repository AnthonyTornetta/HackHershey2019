
// Returns where they are colliding or null if not
PVector getCollidingPoint(PVector lineStart, PVector lineEnd, Obstacle ob)
{
  PVector vec = lineIntersection(lineStart.x, lineStart.y, lineEnd.x, lineEnd.y, ob.getX(), ob.getY(), ob.getX() + ob.getWidth(), ob.getY());
  if(vec != null)
    return vec;
    
  vec = lineIntersection(lineStart.x, lineStart.y, lineEnd.x, lineEnd.y, ob.getX(), ob.getY(), ob.getX(), ob.getY() + ob.getHeight());
  if(vec != null)
    return vec;
    
  vec = lineIntersection(lineStart.x, lineStart.y, lineEnd.x, lineEnd.y, ob.getX(), ob.getY() + ob.getHeight(), ob.getX() + ob.getWidth(), ob.getY() + ob.getHeight());
  if(vec != null)
    return vec;
    
  vec = lineIntersection(lineStart.x, lineStart.y, lineEnd.x, lineEnd.y, ob.getX() + ob.getWidth(), ob.getY(), ob.getX(), ob.getY() + ob.getHeight());
  if(vec != null)
    return vec;
    
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
