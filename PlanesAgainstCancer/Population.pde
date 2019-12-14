class Population{
  ArrayList<Ship> pop = new ArrayList<Ship>();
  
  Population(int n){
    for(int i = 0; i < n; i++){
      pop.add(new Ship());
    }
  }
  
  void update(){
    for(int i = 0; i < pop.size(); i++){
      if(!pop.get(i).dead && !(pop.get(i).step >= pop.get(i).life-1)){
        pop.get(i).update();
      }
      else if(shipsAlive <= 0 || pop.get(i).step >= pop.get(i).life-1) //Life ended
        makeNewPopulation();
    }//for
    bestShip = findBestShip();
  }//update
  
  void show(){
    for(int i = 0; i < pop.size(); i++){
      if(!pop.get(i).dead)
          pop.get(i).show();
    }
  }
  
  void makeNewPopulation(){
    ArrayList<Ship> tempPop = pop;
    float totalFitness = 0;
    
    for(int i = 0; i < tempPop.size(); i++){ //sorts the ships by fitness 
      totalFitness += tempPop.get(i).maxFitness;
    }
    
    for(int i = 0; i < tempPop.size(); i++){
      tempPop.get(i).fitnessPercentage = tempPop.get(i).maxFitness / totalFitness; //Assigns the percentage of the total fitness to each ship
    }
    
    ArrayList<Ship> newPop = new ArrayList<Ship>();
    
    for(int i = 0; i < tempPop.size(); i++){
      newPop.add(new Ship(pickOne(tempPop).dna, pickOne(tempPop).dna));
    }
    
    //if(findBestShip().goalReached)
    //  bestTime = findBestShip().step;
      
    pop = newPop;
    shipsReached = 0;
    generation++;
    shipsAlive = numOfShips;
    player = new Ship("player");
  }
  
  Ship pickOne(ArrayList<Ship> list){
    float r = random(1);
    int index = 0;
    
    while(r>0){
      r -= list.get(index).fitnessPercentage;
      index++;
    }
    index--;
    return list.get(index);
  }
  
  Ship findBestShip(){
    float maxFit = 0;
    int best = 0;
    
    for(int i = 0; i < pop.size(); i++){
      if(pop.get(i).maxFitness > maxFit){
        maxFit = pop.get(i).maxFitness;
        best = i;
      }
    }      
    return pop.get(best);
  }
}//class
