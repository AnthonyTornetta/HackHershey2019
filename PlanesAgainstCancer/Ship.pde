class Ship extends DrawnObject
{
  PVector position = new PVector (width/2, height/2);
  int w, h = 30;
  PShape triangle;
  float angle = -90;
  DNA dna;
  
  public Ship()
  {
    position.x = width/2;
    position.y = height - 50;
    createShip();
    dna = new DNA(life);
  }
  
  public void show()
  {
    pushMatrix();
    translate(position.x, position.y);
    rotate(radians(angle + 90));
    shapeMode(CENTER);
    shape(triangle, 0, 0);
    popMatrix();
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
}
