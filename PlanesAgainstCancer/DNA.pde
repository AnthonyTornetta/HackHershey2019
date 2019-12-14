class DNA
{
  public final static int DNA_LENGTH = 4;
  
  float[] genes = new float[DNA_LENGTH];
  
  public DNA()
  {
    randomize(genes);
  }
  
  public DNA(float[] genes)
  {
    this.genes = genes;
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
