class DNA
{
  public final static int DNA_LENGTH = 4;
  public final static float MUTATION_RATE = 1;
  
  private float[] genes = new float[DNA_LENGTH];
  
  public DNA()
  {
    randomize(genes);
  }
  
  public DNA(float[] genes)
  {
    this.genes = genes;
  }
  
  public DNA combineWith(DNA other)
  { 
    float[] newDna = new float[DNA_LENGTH];
    
    for(int i = 0; i < DNA_LENGTH; i++)
    {
      if(floor(random(2)) == 0)
        newDna[i] = getGene(i);
      else
        newDna[i] = other.getGene(i);
        
      if(random(100) >= MUTATION_RATE)
      {
        newDna[i] = random(1) - 0.5;
      }
    }
    
    return new DNA(newDna);
  }
  
  public void randomize(float[] genes)
  {
    for(int i = 0; i < genes.length; i++)
    {
      genes[i] = random(4) - 2;
    }
  }
  
  public float getGene(int index)
  {
    return genes[index];
  }
}
