class DNA{
  ArrayList<Integer> info = new ArrayList<Integer>();
  
  DNA(int life){ //Constructor
    info = randomize(life);
  }
  
  DNA(ArrayList<Integer> newInfo){
    info = newInfo;
  }
  
  ArrayList<Integer> randomize(int n){
    ArrayList<Integer> newInfo = new ArrayList<Integer>();
    
    for(int i = 0; i < n; i++)
      newInfo.add(floor(random(4)));
      
    return newInfo;
  } 
}
