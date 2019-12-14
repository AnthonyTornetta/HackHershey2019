class Ship extends DrawnObject
{
  private DNA dna;
  
  public Ship(float x, float y, color c)
  {
    super(new PVector(x, y), createShape(TRIANGLE,  0, -20, -10, 15, 10, 15), c);
    dna = new DNA();
  }
  
  public void show()
  {
    super.show();
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
    for(int i = 0; i < 4; i++){
      o.returnCorners(i);
      ///
    }
    ///////////////
    return 0; // TODO: jose
  }
  
  
}
