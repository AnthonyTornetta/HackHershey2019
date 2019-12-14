Population pop = new Population();
Obstacles obs = new Obstacles();

final int SHIP_AMT = 100;

void setup()
{
  size(500, 800);
  surface.setTitle("Bots Vs. Cancer");
  surface.setResizable(true);
  
  for(int i = 0; i < SHIP_AMT; i++)
  {
    pop.addShip(new Ship());
  }
}

void draw()
{
  background(150, 30, 30);
  
  fill(200, 200, 200);
  
  obs.show();
  
  for(Ship ship : pop.getPopulation())
  {
    for(Obstacle o : obs.getObstacles())
    {
      int geneIndex = ship.getGeneIndex(o);
      if(geneIndex != -1)
      {
        ship.addTheta(ship.getGene(geneIndex));
      }
    }
    
    ship.setAcceleration(PVector.fromAngle(ship.getTheta()) * ship.getGene(0));
  }
  
  pop.show();
}
