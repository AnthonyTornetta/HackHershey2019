class Goal extends DrawnObject
{
  float r;
  //color c;
  //PShape s;
  public Goal(float x, float y, float r, color c)
  {
    super(new PVector(x, y), createShape(ELLIPSE, 0, 0, r, r), c);
    //s = createShape(ELLIPSE, 0, 0, r, r);
    //this.c = c;
  }
  
  /*
  public void show()
  {
    pushMatrix();
    translate(getX(), getY());
    rotate(radians(getTheta()));
    shapeMode(CENTER);
    shape(getShape(), 0, 0);
    
    //noFill();
    //ellipse(0, 0, Ship.sightRadius, Ship.sightRadius);  //Remove later
    
    popMatrix();
  }
  */
}
