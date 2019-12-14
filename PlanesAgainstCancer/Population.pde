import java.util.List;

class Population
{
  private List<Ship> population = new ArrayList();
  
  public Population(List<Ship> population)
  {
    this.population = population;
  }
  
  public Population()
  {
    this.population = new ArrayList();
  }
  
  public int numShips()
  {
    return population.size();
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
  public void remove(int index) { population.remove(index); }
  
  public List<Ship> getPopulation() { return population; }
  public void setPopulation(List<Ship> population) { this.population = population; }
}
