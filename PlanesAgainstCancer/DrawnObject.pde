class DrawnObject
{
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private float theta;
  private ShapeType shape;
  
  public DrawnObject()
  {
    position = new PVector();
    velocity = new PVector();
    acceleration = new PVector();
    theta = 0.0;
    
    shape = ShapeType.rectangle;
  }
  
  public DrawnObject(PVector position, ShapeType shape)
  {
    this.position = position;
    velocity = new PVector();
    acceleration = new PVector();
    theta = 0.0;
    
    this.shape = shape;
  }
  
  public DrawnObject(PVector position, PVector velocity, ShapeType shape, float theta)
  {
    this.position = position;
    this.velocity = velocity;
    acceleration = new PVector();
    this.theta = theta;
    
    this.shape = shape;
  }
  
  public DrawnObject(PVector position, PVector velocity, PVector acceleration, ShapeType shape, float theta)
  {
    this.position = position;
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.theta = theta;
    
    this.shape = shape;
  }
  
  void update()
  {
    velocity.mult(.95);
    velocity.add(acceleration);
    position.add(velocity);
  }
  
  void show()
  {
    if(shape == ShapeType.triangle)
    {
      
    }
    else if(shape == ShapeType.rectangle)
    {
      
    }
    else if(shape == ShapeType.circle)
    {
      
    }
  }
  
  public PVector getPosistion() { return position; }
  public void setPosition(PVector position) { this.position = position; }
  public float getX() { return position.x; }
  public void setX(float x) { position.x = x; }
  public float getY() { return position.y; }
  public void setY(float y) { position.y = y; }
  
  public PVector getVelocity() { return velocity; }
  public void setVelocity(PVector velocity) { this.velocity = velocity; }
  public float getVelX() { return velocity.x; }
  public void setVelX(float x) { velocity.x = x; }
  public float getVelY() { return velocity.y; }
  public void setVelY(float y) { velocity.y = y; }
  
    public PVector getAcceleration() { return acceleration; }
  public void setAcceleration(PVector acceleration) { this.acceleration = acceleration; }
    public float getAccelerationX() { return acceleration.x; }
  public void setAccelerationX(float x) { acceleration.x = x; }
  public float getAccelerationY() { return acceleration.y; }
  public void setAccelerationY(float y) { acceleration.y = y; }
  
  public float getTheta() { return theta; }
  public void setTheta(float theta) { this.theta = theta; }
  
  public ShapeType getShape() { return shape; }
  public void setShape(ShapeType shape) { this.shape = shape; }
}
