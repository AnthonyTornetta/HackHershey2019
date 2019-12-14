Population pop = new Population();
Obstacles obs = new Obstacles();

final int SHIP_AMT = 100;

void setup()
{
  size(500, 500);
  surface.setTitle("Bots Vs. Cancer");
  surface.setResizable(true);
  
  for(int i = 0; i < SHIP_AMT; i++)
  {
    pop.addShip(new Ship(width / 2, height / 2));
  }
}

void draw()
{
  background(150, 30, 30);
  
  fill(200);
  
  obs.show();
  
  for(int i = 0; i < pop.getSize(); i++)
  {
    Ship ship = pop.getShip(i);
    
    for(Obstacle o : obs.getObstacles())
    {
      int geneIndex = ship.getGeneIndex(o);
      if(geneIndex != -1)
      {
        System.out.println("WITHIN SENSOR RANGE");
        ship.rot(ship.getGene(geneIndex));
      }
    }
    
    ship.setAcceleration(PVector.fromAngle(ship.getTheta() - radians(90)).mult(ship.getGene(0)));
    ship.update();
    ship.addLifetime();
    
    for(Obstacle o : obs.getObstacles())
    {
      if(ship.getX() >= o.getX() && ship.getX() <= o.getX() + o.getWidth())
      {
        if(ship.getY() >= o.getY() && ship.getY() <= o.getY() + o.getHeight())
        {
          pop.kill(i);
          i--;
        }
      }
    }
  }
  
  //pop.update();
  pop.show();
}

void mousePressed()
{
  if(mouseButton == LEFT)
  {
    obs.drawObstacles(mouseX, mouseY);
  }
}
