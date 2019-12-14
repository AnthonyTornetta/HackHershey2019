Population pop = new Population();
Obstacles obs = new Obstacles();

Goal gul; 

color shipColor = color(0, 0, 255);
color goalColor = color(0, 255, 0);
color obstacleColor = color(255, 0, 0);

final int SHIP_AMT = 100;

void setup()
{
  size(500, 500);
  surface.setTitle("Bots Vs. Cancer");
  surface.setResizable(true);
 
  
  fill(goalColor);
  gul = new Goal(width / 2, 100, 25, #eeeeee);
  
  fill(shipColor);
  for(int i = 0; i < SHIP_AMT; i++)
  {
    pop.addShip(new Ship(width / 2, height / 2));
  }
  
  Obstacle ob = new Obstacle(0, 0, 100, 100, 0);
  println(getCollidingPoint(new PVector(50, 150), new PVector(100, 50), ob));
}

void draw()
{
  background(150, 30, 30);
  
  gul.show();
  
  
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
