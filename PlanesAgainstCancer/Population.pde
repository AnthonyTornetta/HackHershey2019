import java.util.List;

class Population
{
  private List<Ship> population = new ArrayList();
  private List<Ship> deadShips = new ArrayList<Ship>();
  
  public Population(List<Ship> population)
  {
    this.population = population;
  }
  
  public Population()
  {
    this.population = new ArrayList();
  }
  
  public int numDead()
  {
    return deadShips.size();
  }
  
  public void remove(int index)
  {
    population.remove(index);
  }
  
  public void addDead(Ship ship)
  {
    deadShips.add(ship);
  }
  
  public void kill(int index)
  {
    addDead(population.remove(index));
  }
  
  public void show()
  {
    for(Ship ship : population)
    {
      ship.show();
    }
  }
  
  
  public void addShip(Ship ship) { population.add(ship); }
  
  public Ship getShip(int i) { return population.get(i); }
  
  public int getSize() { return population.size(); }

  
  public List<Ship> getPopulation() { return population; }
  public void setPopulation(List<Ship> population) { this.population = population; }
  
  public List<Ship> getDead() { return deadShips; }
  public void setDead(List<Ship> deadShips) { this.deadShips = deadShips; }
}
