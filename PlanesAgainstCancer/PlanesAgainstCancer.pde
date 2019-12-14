Population pop = new Population();

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
  rect(0, 0, 100, 100);
}
