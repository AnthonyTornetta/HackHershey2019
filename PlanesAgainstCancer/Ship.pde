class Ship extends DrawnObject
{
  private float w, h;
  private DNA dna;

  private int lifetime = 0, maxLifeTime = 500;
  private static final int sightRadius = 50;
  
  private float fitnessPercentage, fitness = 0, maxFitness = 0;
  

  public Ship()
  {
    super(new PVector(width / 2, height / 2), shipWidth, shipHeight, shipColor, ShapeType.triangle);
    w = 20;
    h = 15;
    dna = new DNA();
  }
  
  public Ship(DNA d1, DNA d2){
    super(new PVector(width / 2, height / 2), createShape(TRIANGLE,  0, 0, -10, 15, 10, 15), 255);
    w = 20;
    h = 15;
    dna = d1.combineWith(d2);
  }

  public Ship(float x, float y)
  {
    super(new PVector(x, y), shipWidth, shipHeight, shipColor, ShapeType.triangle);
    w = 20;
    h = 15;
    dna = new DNA();
  }

  public Ship(float x, float y, float w, float h)
  {
    super(new PVector(width / 2, height / 2), shipWidth, shipHeight, shipColor, ShapeType.triangle);
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
  
  public void show()
  {
    pushMatrix();
    translate(getX(), getY() + h / 2);
    rotate(radians(getTheta()));
    translate(0, -h / 2);
    shapeMode(CENTER);
    shape(getShape(), 0, 0);
    popMatrix();
  }

  int getGeneIndex(Obstacle o)
  {
    PVector sensorPos = new PVector(getX(), getY() + h);
    
    PVector endPoints[] = new PVector[DNA.DNA_LENGTH - DNA.SENSOR_OFFSET];
    
    for(int i = 0; i < endPoints.length; i++)
    {
      float theta = PI / (i + DNA.SENSOR_OFFSET + 1);
      endPoints[i] = new PVector(sensorPos.x + cos(theta) * sightRadius, sensorPos.y - sin(theta) * sightRadius);
      
      PVector good = getCollidingPoint(sensorPos, endPoints[i], o);
      
      if(good != null)
      {
        println(endPoints[i]);
        return i + DNA.SENSOR_OFFSET;
      }
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
  
  public void calculateFitness(){
    float distance = dist(getX(), getY(), gul.getX(), gul.getY());
    
    fitness = map(distance, 0, sqrt(width*width + height*height), 50, 0);  //Distance can give up to 50 points
    fitness += map(lifetime, 0, maxLifeTime, 0, 50);  //steps give up to 50 points
    
    if(distance <= gul.r){  //makes it to the goal
      setVelocity(new PVector(0, 0));
      fitness = map(lifetime, 0, maxLifeTime, maxLifeTime, 0);  //Accounts for steps
      fitness = map(fitness, 0, maxLifeTime, 5000, 10000); //normalizes fitness [5000,10000]
      fitness *= 10;
    }
      
    if(crossesNoLines())
      fitness *= 1000;
      
    fitness = pow(fitness, 5);
    
    if(fitness > maxFitness)
      maxFitness = fitness;
  }

  
  boolean crossesNoLines(){
    for(int i = 0; i < obs.obstacleList.size(); i++){
      Obstacle temp = obs.obstacleList.get(i);
      
      if(linesTouching(getX(), getY(), gul.getX(), gul.getY(), temp.getX(), temp.getY(), temp.getX() + temp.w, temp.getY()))
        return false;
      if(linesTouching(getX(), getY(), gul.getX(), gul.getY(), temp.getX(), temp.getY(), temp.getX(), temp.getY() + temp.h))
        return false;
      if(linesTouching(getX(), getY(), gul.getX(), gul.getY(), temp.getX() + temp.w, temp.getY(), temp.getX() + temp.w, temp.getY() + temp.h))
        return false;
      if(linesTouching(getX(), getY(), gul.getX(), gul.getY(), temp.getX(), temp.getY() + temp.h, temp.getX() + temp.w, temp.getY() + temp.h))
        return false;
    }
    return true;
  }
  boolean linesTouching(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    float denominator = ((x2 - x1) * (y4 - y3)) - ((y2 - y1) * (x4 - x3));
    float numerator1 = ((y1 - y3) * (x4 - x3)) - ((x1 - x3) * (y4 - y3));
    float numerator2 = ((y1 - y3) * (x2 - x1)) - ((x1 - x3) * (y2 - y1));
  
    // Detect coincident lines (has a problem)
    if (denominator == 0) return numerator1 == 0 && numerator2 == 0;
  
    float r = numerator1 / denominator;
    float s = numerator2 / denominator;
  
    return (r >= 0 && r <= 1) && (s >= 0 && s <= 1);
  }
  
  public void addLifetime() { lifetime++; }
  public int getLifetime() { return lifetime; }
  public int getSightRadius() {return sightRadius;}
  public DNA getDNA() {return dna;}
  public void setFitnessPercentage(float p) { fitnessPercentage = p;}
  public float getFitnessPercentage() { return fitnessPercentage;}
  public float getMaxFitness() { return maxFitness;}
}
