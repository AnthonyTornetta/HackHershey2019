class Obstacles
{
  ArrayList<Obstacle> obstacleList = new ArrayList<Obstacle>();
  int numOfObstacles = 0, clickCounter = 0;
  int tempX, tempY;
  
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
      //backColor = color(0, 100, 0);
    }
    else if(clickCounter == 2)
    {
      obstacleList.add(new Obstacle(tempX, tempY, x - tempX, y - tempY));
      clickCounter = 0;
      numOfObstacles++;
      //backColor = color(0);
      print("New Obstacle! ");
      println(numOfObstacles);
      //bestTime = 999;
      //obstacleList = sortByHeight();
    }
  }
}
