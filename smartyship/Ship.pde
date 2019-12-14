
class Ship{
  PShape body, triangle, tail, line1, line2; //shape of the ship (triangle)
  PVector location = new PVector (width/2, height/2);
  PVector force;
  PVector vel = new PVector(0,0);
  color c;
  float angle = -90, fitness = 0, fitnessPercentage = 0, maxFitness = 0;
  int radius = 50, life = 1000, step = 0, mutationRate = 1;
  boolean dead = false, goalReached = false, best = false, deathByCollision = false, player = false;
  DNA dna;
  
  Ship(){
    makeShape();
    location.x = width/2;
    location.y = height - 50;
    dna = new DNA(life);
  }
  
  Ship(String s){
    makeShape();
    location.x = width/2;
    location.y = height - 50;
    
    if(s.equals("player"))
      player = true;
  }
  
  Ship(DNA d){
    makeShape();
    location.x = width/2;
    location.y = height - 50;
    dna = d;
  }
  
  Ship(DNA d1, DNA d2){
    makeShape();
    location.x = width/2;
    location.y = height - 50;
    dna = combineDNAs(d1, d2);
  }
  
  void show(){
    //draws ship and rotates
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(angle + 90));
    shapeMode(CENTER);
    shape(body, 0 , 0);
    popMatrix();
  }
  
  void update(){
    if(!goalReached && !player){
      move();
      //keepInScreen();
      outOfScreenKill();
      checkCollision();
      setFitness();
      
      location.add(vel);
      vel.mult(.95);
    }
    else if(player && !dead){
       move();
      //keepInScreen();
      outOfScreenKill();
      checkCollision();
      setFitness();
      
      location.add(vel);
      vel.mult(.99);
    }
  }
  
  void move(){
    if(!goalReached && !player){      
      if(dna.info.get(step) == 0){
        force = PVector.fromAngle(radians(angle));
        force.mult(2); //force applied
        vel.add(force); //force added to velocity
      }
      else if(dna.info.get(step) == 1)
        angle += 15;
      
      else if(dna.info.get(step) == 2)
        angle -= 15;
        
      step++;
    }
    else if(player && !goalReached){
      if(keys[0]){
        force = PVector.fromAngle(radians(angle));
        force.mult(.1); //force applied
        vel.add(force); //force added to velocity
      }
      if(keys[1])
        angle -= 1.5;
        
      if(keys[2])
        angle += 1.5;
    }
  }
  
  void setFitness(){
    float distance;
    
    distance = findDistance();
    
    fitness = map(distance, 0, sqrt(width*width + height*height), 50, 0);  //Distance can give up to 50 points
    fitness += map(step, 0, life, 0, 50);  //steps give up to 50 points
    
    if(distance <= goal.size/2){
      goalReached = true;
      shipsReached++;
      vel.mult(0);
      shipsAlive--;
      fitness = map(step, 0, life, life, 0);  //Accounts for steps
      fitness = map(fitness, 0, life, 5000, 10000); //normalizes fitness [5000,10000]
      fitness *= 10;
      
      if(step < bestTime && !player)
        bestTime = step;
    }
    
    //if(deathByCollision)
    //  fitness *= .1;
      
    if(crossesNoLines())
      fitness *= 1000;
      
    fitness = pow(fitness, 5);
    
    if(fitness > maxFitness)
      maxFitness = fitness;
  }
  
  boolean crossesNoLines(){
    for(int i = 0; i < obstacles.obstacleList.size(); i++){
      Obstacle temp = obstacles.obstacleList.get(i);
      
      if(linesTouching(this.location.x, this.location.y, goal.location.x, goal.location.y, temp.location.x, temp.location.y, temp.location.x + temp.w, temp.location.y))
        return false;
      if(linesTouching(this.location.x, this.location.y, goal.location.x, goal.location.y, temp.location.x, temp.location.y, temp.location.x, temp.location.y + temp.h))
        return false;
      if(linesTouching(this.location.x, this.location.y, goal.location.x, goal.location.y, temp.location.x + temp.w, temp.location.y, temp.location.x + temp.w, temp.location.y + temp.h))
        return false;
      if(linesTouching(this.location.x, this.location.y, goal.location.x, goal.location.y, temp.location.x, temp.location.y + temp.h, temp.location.x + temp.w, temp.location.y + temp.h))
        return false;
    }
    return true;
  }
  
  //void setFitness(){
  //  float distance;
    
  //  distance = findDistance();
    
  //  fitness = map(distance, 0, width, width, 0);
    
  //  if(distance <= goal.size/2){
  //    goalReached = true;
  //    shipsReached++;
  //    shipsAlive--;
      
  //    fitness *= 100;
  //  }
  //  else if(dead)
  //    fitness = 1;
      
  //  if(step < bestTime)
  //    bestTime = step;
      
  //  fitness = pow(fitness, 5);
  //}
  
  float findDistance(){
    return dist(location.x, location.y, goal.location.x, goal.location.y);
  }
  //float findDistance(){
  //  PVector lastPoint = new PVector();
  //  float distance = 0;
  //  boolean clear = true;
  //  //int breaker = 0;
  //  lastPoint.x = goal.location.x;
  //  lastPoint.y = goal.location.y;
    
  //  for(int i = 0; i < obstacles.obstacleList.size(); i++){
  //    Obstacle temp = obstacles.obstacleList.get(i);
      
  //    if(linesTouching(lastPoint.x, lastPoint.y, this.location.x, this.location.y, temp.location.x, temp.location.y, temp.location.x + temp.w, temp.location.y + temp.h)){
  //      clear = false;
  //      distance += calcComplexDist(i, lastPoint);
  //      lastPoint.x = obstacles.obstacleList.get(i).location.x + obstacles.obstacleList.get(i).w;
  //      lastPoint.y = obstacles.obstacleList.get(i).location.y + obstacles.obstacleList.get(i).h/2;
  //    }
  //  }
  //  if(!clear)
  //    return distance;
    
  //  else
  //    return dist(location.x, location.y, goal.location.x, goal.location.y);
  //}
  
  //float calcComplexDist(int breaker, PVector lastPoint){
  //  float rhs, lhs;
  //  rhs = dist(lastPoint.x, lastPoint.y, obstacles.obstacleList.get(breaker).location.x + obstacles.obstacleList.get(breaker).w,
  //             obstacles.obstacleList.get(breaker).location.y + obstacles.obstacleList.get(breaker).h/2);
  //  rhs += dist(obstacles.obstacleList.get(breaker).location.x + obstacles.obstacleList.get(breaker).w,
  //              obstacles.obstacleList.get(breaker).location.y + obstacles.obstacleList.get(breaker).h/2, this.location.x, this.location.y);
    
  //  lhs = dist(goal.location.x, goal.location.y, obstacles.obstacleList.get(breaker).location.x, obstacles.obstacleList.get(breaker).location.y);
  //  lhs += dist(obstacles.obstacleList.get(breaker).location.x, obstacles.obstacleList.get(breaker).location.y, this.location.x, this.location.y);
    
  //  return min(rhs, lhs);
  //}
  
  boolean linesTouching(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    float denominator = ((x2 - x1) * (y4 - y3)) - ((y2 - y1) * (x4 - x3));
    float numerator1 = ((y1 - y3) * (x4 - x3)) - ((x1 - x3) * (y4 - y3));
    float numerator2 = ((y1 - y3) * (x2 - x1)) - ((x1 - x3) * (y2 - y1));
  
    // Detect coincident lines (has a problem)
    if (denominator == 0) return numerator1 == 0 && numerator2 == 0;
  
    float r = numerator1 / denominator;
    float s = numerator2 / denominator;
  
    return (r >= 0 && r <= 1) && (s >= 0 && s <= 1);
  }
    
  void outOfScreenKill(){ //Kills ship if out of screen
    if(location.x > width || location.x < 0){
      dead = true;
      shipsAlive--;
    }
      
    if(location.y > height || location.y < 0){
      dead = true;
      shipsAlive--;
    }
  }
  
  void checkCollision(){
    for(Obstacle obs: obstacles.obstacleList){
      if(location.x > obs.location.x && location.x < obs.location.x + obs.w){
        if(location.y > obs.location.y && location.y < obs.location.y + obs.h){
          dead = true;
          deathByCollision = true;
          shipsAlive--;
        }
      }
    }
  }
  
  DNA combineDNAs(DNA d1, DNA d2){
    ArrayList<Integer> newInfo = new ArrayList<Integer>();
    
    for(int i = 0; i < life; i++){
      if(floor(random(100)) <= mutationRate)
        newInfo.add(floor(random(4)));
      
      else{
        int parent = floor(random(2));
        
        if(parent == 0)
          newInfo.add(d1.info.get(i));
        else
          newInfo.add(d2.info.get(i));
      }
    }
    return new DNA(newInfo);
  }
  
  void keepInScreen(){
    if(location.x > width)
      location.x = 0;
      
    if(location.x < 0)
      location.x = width;
      
    if(location.y > height)
      location.y = 0;
      
    if(location.y < 0)
      location.y = height;
  }
 
  void makeShape(){
    shapeMode(CENTER);
    fill(255);
    stroke(255);
    body = createShape(GROUP);
    
    //Creates the ship
    //                               x1 y1  x2  y2  x3  y3
    triangle = createShape(TRIANGLE, 0, -20, -10, 15, 10, 15);
    triangle.setFill(c);
    triangle.setStroke(255);
    
    line1 = createShape(LINE,  0, -20, -2, 15);
    line1.setFill(c);
    line1.setStroke(255);
    
    line2 = createShape(LINE,  0, -20, 2, 15);
    line2.setFill(c);
    line2.setStroke(255);
    
    tail = createShape(TRIANGLE, -2, 15, 2, 15, 0, 20);
    tail.setFill(c);
    tail.setStroke(255);
    
    body.addChild(triangle);
    body.addChild(line1);
    body.addChild(line2);
    body.addChild(tail);
    
    body.setFill(255);
    body.setStroke(255);
  }
 }
