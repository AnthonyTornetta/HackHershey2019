class Obstacles
{
  private ArrayList<Obstacle> obstacleList = new ArrayList<Obstacle>();
  private int clickCounter = 0;
  private int tempX, tempY;

  Obstacles()
  {  
    obstacleList.add(new Obstacle(0, 0, width, 10, obstacleColor));
    obstacleList.add(new Obstacle(0, 0, 10, height, obstacleColor));
    obstacleList.add(new Obstacle(0, height, width, 10, obstacleColor));
    obstacleList.add(new Obstacle(width, 0, 10, height, obstacleColor));
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
      boolean badX = tempX > x;
      boolean badY = tempY > y;
      
      obstacleList.add(new Obstacle(badX ? x : tempX, badY ? y : tempY, badX ? tempX - x : x - tempX, badY ? tempY - y : y - tempY, obstacleColor));
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
