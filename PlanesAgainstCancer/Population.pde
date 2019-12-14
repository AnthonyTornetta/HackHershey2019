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

  public List<Ship> sexyTime(){
    List<Ship> newPop = new ArrayList<Ship>();
    List<Ship> sortedDeadShips = new ArrayList<Ship>();
    sortedDeadShips = sortByFitness(deadShips);  ///TODO

    float totalFitness = 0;

    for(int i = 0; i < sortedDeadShips.size(); i++){  //Total fitness of every ship combined
      //totalFitness += sortedDeadShips.get(i).getMaxFitness();  //Need to calculate Max Fitness
    }

    for(int i = 0; i < sortedDeadShips.size(); i++){
      //sortedDeadShips.get(i).setFitnessPercentage(sortedDeadShips.get(i).getMaxFitness() / totalFitness);  //Sets fitness percentage to every dead ship
    }
    for(int i = 0; i< sortedDeadShips.size(); i++){
      newPop.add(new Ship(pickAShip(sortedDeadShips).getDNA(), pickAShip(sortedDeadShips).getDNA()));  //Adds new Ships with combined DNA of picked Ships
    }

    return newPop;
  }

  public Ship pickAShip(List<Ship> list){
    float r = random(1);
    int index = 0;

    while(r > 0){
      r -= list.get(index).getFitnessPercentage();     //TODO Create getFitnessPercentage
    }
    index--;
    return list.get(index);
  }

  public List<Ship> sortByFitness(List<Ship> list){ //Sorts by Max Fitness
    List<Ship> sorted = new ArrayList<Ship>();

    while(!list.isEmpty())
    {
      //Must have been a value less than 0.
      float max = -999;
      int index = -1;
      for(int j = 0; j < list.size(); j++){
        if(list.get(j).getMaxFitness() > max){
           max = list.get(j).getMaxFitness();
           index = j;
        }
      }
      sorted.add(list.remove(index));
    }
    return sorted;
  }

  public void addShip(Ship ship) { population.add(ship); }

  public Ship getShip(int i) { return population.get(i); }

  public int getSize() { return population.size(); }


  public List<Ship> getPopulation() { return population; }
  public void setPopulation(List<Ship> population) { this.population = population; }

  public List<Ship> getDead() { return deadShips; }
  public void setDead(List<Ship> deadShips) { this.deadShips = deadShips; }
}
