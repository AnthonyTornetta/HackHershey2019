import java.util.List;

class Population
{
  private List<TriangleShip> population = new ArrayList();
  
  public Population(List<TriangleShip> population)
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
    for(TriangleShip ship : population)
    {
      ship.show();
    }
  }
  
  public void addShip(TriangleShip ship) { population.add(ship); }
  
  public List<TriangleShip> getPopulation() { return population; }
  public void setPopulation(List<TriangleShip> population) { this.population = population; }
}
