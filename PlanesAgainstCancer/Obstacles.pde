class Obstacles
{
  private ArrayList<Obstacle> obstacleList = new ArrayList<Obstacle>();
  private int clickCounter = 0;
  private int tempX, tempY;

  Obstacles(){
  }

  void show()
  {
    for(int i = 0; i < obstacleList.size(); i++)
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
      print("New Obstacle! ");
      println(obstacleList.size());
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
