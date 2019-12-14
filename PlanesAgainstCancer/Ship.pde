class Ship extends DrawnObject
{
  private float w, h;
  private DNA dna;

  private int lifetime = 0;
  private static final int sightRadius = 50;

  public Ship()
  {
    super(new PVector(width / 2, height / 2), 20, 15, shipColor, ShapeType.triangle);
    w = 20;
    h = 15;
    dna = new DNA();
  }

  public Ship(float x, float y)
  {
    super(new PVector(x, y), 20, 15, shipColor, ShapeType.triangle);
    w = 20;
    h = 15;
    dna = new DNA();
  }

  public Ship(float x, float y, float w, float h)
  {
    super(new PVector(width / 2, height / 2), w, h, shipColor, ShapeType.triangle);
    this.w = w;
    this.h = h;
    dna = new DNA();
  }

  public void edgeDetection()
  {
    if(getX() > width)
      setX(0);

    if(getX() < 0)
      setX(width);

    if(getY() > width)
      setY(0);

    if(getY() < 0)
      setY(width);
  }

  float getGene(int index)
  {
    return dna.getGene(index);
  }

  int getGeneIndex(Obstacle o)
  {
    PVector sensorPos = new PVector(getX(), getY() + h);
    
    PVector endPoints[] = new PVector[5];
    
    for(int i = 0; i < endPoints.length; i++)
    {
      float theta = PI / (i + 2);
      endPoints[i] = new PVector(sin(theta) * sightRadius, cos(theta) * sightRadius);
    }
    
    return -1;
  }

  // Returns where they are colliding or null if not
  public PVector getCollidingPoint(PVector lineStart, PVector lineEnd, Obstacle ob)
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
  
  public void addLifetime() { lifetime++; }
  public int getLifetime() { return lifetime; }
  public int getSightRadius() {return sightRadius;}
}
