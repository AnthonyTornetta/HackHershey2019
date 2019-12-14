class DrawnObject
{
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private float theta;
  
  private PShape shape;
  private color c;
  
  public DrawnObject()
  {
    position = new PVector();
    velocity = new PVector();
    acceleration = new PVector();
    theta = 0.0;
        
    c = #aaaaaa;
    shape = createShape(RECT, position.x, position.y, 10, 10);
  }
  
  public DrawnObject(PVector position, PShape s, color c)
  {
    this.position = position;
    velocity = new PVector();
    acceleration = new PVector();
    theta = 0.0;
    
    this.c = c;
    this.shape = s;
  }
  
  public DrawnObject(PVector position, float r, color c)
  {
    println("asdf");
    this.position = position;
    velocity = new PVector();
    acceleration = new PVector();
    theta = 0.0;
    
    this.c = c;
    
    fill(c);
    this.shape = createShape(ELLIPSE, 0, 0, r, r);
  }
  
  public DrawnObject(PVector position, float w, float h, color c, ShapeType s)
  {
    this.position = position;
    velocity = new PVector();
    acceleration = new PVector();
    theta = 0.0;
 
    this.c = c;
    
    fill(c);
    if(s == ShapeType.rectangle)
    {
      this.shape = createShape(RECT, 0, 0, w, h);
    }
    else
    {
      this.shape = createShape(TRIANGLE,  0, 0, -w/2, h, w/2, h);
    }
  }
  
  public DrawnObject(PVector position, float w, float h, color c)
  {
    println("asdf");
    this.position = position;
    velocity = new PVector();
    acceleration = new PVector();
    theta = 0.0;
    
    this.c = c;
    
    fill(c);
    this.shape = createShape(TRIANGLE,  0, 0, -10, 15, 10, 15);
  }
  
  public DrawnObject(PVector position, PVector velocity, float theta, PShape shape, color c)
  {
    this.position = position;
    this.velocity = velocity;
    acceleration = new PVector();
    this.theta = theta;
    
    this.c = c;
    this.shape = shape;

  }
  
  public DrawnObject(PVector position, PVector velocity, PVector acceleration, float theta, PShape shape, color c)
  {
    this.position = position;
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.theta = theta;
    
    this.c = c;
    this.shape = shape;

  }
  
  public void update(float maxVel)
  {
    //velocity.mult(.95);
    velocity.add(acceleration);
    if(getVelX() > maxVel)
      setVelX(maxVel);
    if(getVelY() > maxVel)
      setVelY(maxVel);
      
    position.add(velocity);
  }
  
  public void show()
  {
    pushMatrix();
    translate(position.x, position.y);
    rotate(radians(theta));
    shapeMode(CENTER);
    shape(shape, 0, 0);
    popMatrix();
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
  public void setAcceleration(float acceleration) 
  { 
    this.acceleration = PVector.fromAngle(getTheta() - radians(90)).mult(acceleration);
  }
  public float getAccelerationX() { return acceleration.x; }
  public void setAccelerationX(float x) { acceleration.x = x; }
  public float getAccelerationY() { return acceleration.y; }
  public void setAccelerationY(float y) { acceleration.y = y; }
  
  public float getTheta() { return theta; }
  public void setTheta(float theta) { this.theta = theta; }
  public void rot(float dTheta) { this.theta += dTheta; }
  
  public PShape getShape() { return shape; }
  public void setShape(PShape shape) { this.shape = shape; }
  
  public color getColor() { return c; }
  public void setColor(color c) { this.c = c; }
}
