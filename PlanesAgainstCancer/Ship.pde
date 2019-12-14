class Ship extends DrawnObject
{
  PVector position = new PVector (width/2, height - 50);
  int w = 15, h = 30;
  PShape triangle;
  float angle = -90;
  DNA dna;
  
  public Ship()
  {
    position.x = width/2;
    position.y = height - 50;
    createShip();
    dna = new DNA();
  }
  
  public void show()
  {
    super.show();
  }
  
  public void createShip()
  {   
    shapeMode(CENTER);
    fill(255);
    stroke(255);
    triangle = createShape(TRIANGLE,  0, -20, -10, 15, 10, 15);
  }
  
  public void edgeDetection()
  {
    if(position.x > width)
      position.x = 0;
      
    if(position.x < 0)
      position.x = width;
      
    if(position.y > height)
      position.y = 0;
    
    if(position.y < 0)
      position.y = height;
  }
  
  float getGene(int index)
  {
    return dna.getGene(index);
  }
  
  int getGeneIndex(Obstacle o)
  {
    ArrayList<PVector> corners = new ArrayList<PVector>();
    PVector centerPoint = new PVector(position.x, position.y + h);
    int radius = 50; //Variable
    
    for(int i = 0; i < 4; i++)
      corners.add(o.returnCorners(i));
      
    for(int i = 4; i < corners.size(); i++){
      PVector collisionPoint = getCollidingPoint(centerPoint, corners.get(i));
      float distance = dist(collisionPoint.x, collisionPoint.y, centerPoint.x, centerPoint.y);
      
      if(distance <= radius){
        float theta = acos((abs(collisionPoint.x - centerPoint.x)) / distance);
        
        if(theta >= 0 && theta < PI/4)
          return 4;
        else if(theta >= PI/4 && theta < PI/2)
          return 3; 
        else if(theta >= PI/2 && theta < 3*PI/4)
          return 2; 
        else if(theta >= 3*PI/4 && theta <= PI)
          return 1; 
      }
    }
    return -1;
  }
  
  // Returns where they are colliding or null if not
  public PVector getCollidingPoint(PVector lineStart, PVector lineEnd)
  {
    for(int dx = 0; dx <= 1; dx++)
    {
      for(int dy = 0; dy <= 1; dy++)
      {
        PVector vec = lineIntersection(position.x, position.y, position.x + w * dx, position.y + h * dy, lineStart.x, lineStart.y, lineEnd.x, lineEnd.y);
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
}
