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
    pop.addShip(new Ship(width / 2, height / 2));
  }
}

//boolean isOverlapped(Shape s1, Shape s2, float rotationA, float rotationB) 
//{
//   // create Areas from your Java Shapes
//   Area s1Area = new Area(s1);
//   Area s2Area = new Area(s2);

//  //translate according to the current rotate angle and the shapes position
//   AffineTransform s1Transformation = AffineTransform.getRotateInstance(rotateAngle1, s1.x, s1.y);
//   s1Area.transform(s1Transformation);
//   AffineTransform s2Transformation = AffineTransform.getRotateInstance(rotateAngle2, s2.x, s2.y);
//   s2Area.transform(s2Transformation);

//   // test if they overlap
//   s1Area.intersect(s2Area);

//   if (!s1.isEmpty())
//   {
//    return true;
//   }
//   else
//   {
//  return false;
//   }
//}

ArrayList<Ship> deadShips = new ArrayList<Ship>();

void draw()
{
  background(150, 30, 30);
  
  fill(200, 200, 200);
  
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
    
    for(Obstacle o : obs.getObstacles())
    {
      if(ship.getX() >= o.getX() && ship.getX() <= o.getX() + o.getWidth())
      {
        if(ship.getY() >= o.getY() && ship.getY() <= o.getY() + o.getHeight())
        {
          deadShips.add(ship);
          pop.remove(i);
          i--;
        }
      }
    }
  }
  
  pop.show();
}
