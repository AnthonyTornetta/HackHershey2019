import java.util.*;
Population ships;
Goal goal;
Ship bestShip, player;
Obstacles obstacles;
int shipsReached = 0, generation = 0, numOfShips = 100, bestTime = 999, shipsAlive = numOfShips;
boolean start = false, mouseReleased = false;
boolean [] keys;
color backColor;

void setup(){
  frameRate(500);
  fullScreen();
  backColor = color(0);
  background(backColor);
  
  ships = new Population(numOfShips);
  player = new Ship("player");
  goal = new Goal(width/2, 100, 100); 
  obstacles = new Obstacles();
  keys = new boolean[3];
}

void draw(){  
  println(frameRate);
  background(backColor);
  
  if(start){
    goal.show();
    obstacles.show();
    
    ships.update();
    ships.show();
    //bestShip.show();
    
    textSize(50);
    text("Best Time: " + bestTime, 50, height -130);
    text("Ships reached: " + shipsReached + "/" + numOfShips, 50, height -75);
    text("Generation: " + generation, 50, height - 20); 
  }
  else{
    goal.show();
    obstacles.show();
    ships.show();
    player.show();
    player.update();
    
    
    fill(255);
    textSize(25);
    text("Press Enter to start \nClick on the screen to place the top-left and bottom-right points of a new obstacle.", 100, height/2);
  }
}

void reset(){
  ships = new Population(numOfShips);
  generation = 0;
  bestTime = 999;
  shipsAlive = numOfShips;
}

void keyPressed(){
  if(key == ENTER)
    start = !start;
    
  if(key == BACKSPACE)
    reset();
    
  if(key == 'w' || key == 'W')  //Player
    keys[0] = true;
  
  if(key == 'a' || key == 'A')
    keys[1] = true;
      
  if(key == 'd' || key == 'D')
    keys[2] = true;
}

void keyReleased(){
  if(key == 'w' || key == 'W') //right Player
    keys[0] = false;
  
  if(key == 'a' || key == 'A')
    keys[1] = false;
    
  if(key == 'd' || key == 'D')
    keys[2] = false;
}

void mousePressed(){
  if(mouseButton == LEFT){
    obstacles.drawObstacles(mouseX, mouseY);
  }
}

//void mouseReleased(){
//  mouseReleased = true;
//}
