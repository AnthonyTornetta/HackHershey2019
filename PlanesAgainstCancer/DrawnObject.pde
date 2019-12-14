class DrawnObject
{
  private PVector position;
  private PVector velocity;
  private float theta;
  
  public DrawnObject()
  {
    position = new PVector();
    velocity = new PVector();
    theta = 0.0;
  }
  
  public DrawnObject(PVector position)
  {
    this.position = position;
    velocity = new PVector();
    theta = 0.0;
  }
  
  public DrawnObject(PVector position, PVector velocity, float theta)
  {
    this.position = position;
    this.velocity = velocity;
    this.theta = theta;
  }
  
  void update()
  {
    velocity.mult(.95);
  }
  
  void show()
  {
    
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
  
  public float getTheta() { return theta; }
  public void setTheta(float theta) { this.theta = theta; }
}
