Population pop = new Population();
Obstacles obs = new Obstacles();

Goal gul; 

final int SHIP_AMT = 100;

boolean started = false;

void setup()
{
  size(500, 500);
  surface.setTitle("Bots Vs. Cancer");
  surface.setResizable(true);
 
  gul = new Goal(width / 2, 100, 25, #aaaaaa);
  
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
  
  fill(200);
  
  gul.show();
  obs.show();
  
  if(started)
  {
  
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
      
      ship.setAcceleration(ship.getGene(DNA.GENE_ACCELERATION));
      ship.update(ship.getGene(DNA.GENE_MAX_SPEED));
      ship.addLifetime();
      
      for(Obstacle o : obs.getObstacles())
      {
        if(ship.getX() >= o.getX() && ship.getX() <= o.getX() + o.getWidth())
        {
          if(ship.getY() >= o.getY() && ship.getY() <= o.getY() + o.getHeight())
          {
            pop.kill(i);
            i--;
            
            if(pop.getSize() <= 0){
              pop = pop.sexyTime();
            }
          }
        }
      }
    }
  }
  
  //pop.update();
  pop.show();
}

void keyPressed()
{
  if(key == ENTER)
  {
    started = true;
  }
}

void mousePressed()
{
  if(mouseButton == LEFT)
  {
    obs.drawObstacles(mouseX, mouseY);
  }
}
