class DNA
{
  public final static int DNA_LENGTH = 6;
  public final static float MUTATION_RATE = 1;
  
  public final static int GENE_ACCELERATION = 0;
  public final static int GENE_MAX_SPEED = 1;
  
  public final static int SENSOR_OFFSET = 2;
  
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
    genes[0] = 1;
    genes[1] = 1;//random(.2) + 0.005;
    for(int i = SENSOR_OFFSET; i < genes.length; i++)
    {
      genes[i] = random(30) - 15;
    }
  }
  
  public float getGene(int index)
  {
    return genes[index];
  }
}
