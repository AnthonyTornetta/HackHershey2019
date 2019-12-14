class Obstacles
{
  private ArrayList<Obstacle> obstacleList = new ArrayList<Obstacle>();
  private int numOfObstacles = 0, clickCounter = 0;
  private int tempX, tempY;

  Obstacles(){
  }

  void show()
  {
    for(int i = 0; i < numOfObstacles; i++)
    {
      obstacleList.get(i).show();
    }
  }

  void drawObstacles(int x, int y)
  {

    clickCounter++;

    if(clickCounter == 1)
    {
      tempX = x;
      tempY = y;
    }
    else if(clickCounter == 2)
    {
      obstacleList.add(new Obstacle(tempX, tempY, x - tempX, y - tempY, 255));
      clickCounter = 0;
      numOfObstacles++;
      print("New Obstacle! ");
      println(numOfObstacles);
    }
  }

  ArrayList<PVector> returnObstacleCorners(){
    ArrayList<PVector> corners = new ArrayList<PVector>();
    for(Obstacle temp: obstacleList){
      for(int i = 0; i < 4; i++){
        corners.add(temp.returnCorners(i));  //Should work???
      }
    }
    return corners;  //Check later
  }

  public ArrayList<Obstacle> getObstacles() { return obstacleList; }
}
